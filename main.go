package main
import (
	firebase "firebase.google.com/go"
	"fmt"
	"html/template"
        "net/http"
	"time"

	"google.golang.org/appengine/datastore"
	"google.golang.org/appengine/log"

        "google.golang.org/appengine" // Required external App Engine library
)

var (
        indexTemplate = template.Must(template.ParseFiles("index.html"))
)
var (
        firebaseConfig = &firebase.Config{
                DatabaseURL:   "https://console.firebase.google.com > Overview > Add Firebase to your web app",
                ProjectID:     "https://console.firebase.google.com > Overview > Add Firebase to your web app",
                StorageBucket: "https://console.firebase.google.com > Overview > Add Firebase to your web app",
        }
        indexTemplate = template.Must(template.ParseFiles("index.html"))
)

type templateParams struct {
        Notice string
        Name   string
	Message string
	Posts []Post   //stores an array of posts types
}
type Post struct {
	Author string //variable for name field
	Message string //variable for messg field
	Posted string  //stores date and time of message. Make a string for formating purpose
}
func indexHandler(w http.ResponseWriter, r *http.Request) {
        // if statement redirects all invalid URLs to the root homepage.
        // Ex: if URL is http://[YOUR_PROJECT_ID].appspot.com/FOO, it will be
        // redirected to http://[YOUR_PROJECT_ID].appspot.com.
        if r.URL.Path != "/" { //redirect invalid paths to home page
                http.Redirect(w, r, "/", http.StatusFound)
                return
        }
	params := templateParams{}

	if r.Method == "GET" {
        indexTemplate.Execute(w, params)
        return
	}

	// It's a POST request, so handle the form submission. User submitted content

	name := r.FormValue("name") //grab value of name field
	params.Name = name // Preserve the name field.
	if name == "" {
        	name = "Anonymous Gopher"
	}

	if r.FormValue("message") == "" { //preserve msg field
        	w.WriteHeader(http.StatusBadRequest)

       		 params.Notice = "No message provided"
       		 indexTemplate.Execute(w, params)
       		 return
	}

	//Adding contents to data base
	est, err :=time.LoadLocation("America/Indianapolis")

	if err != nil{
	  fmt.Println(err)
	  fmt.Println(est)   //prints out err if loadLocation fails
	}
	estTime := time.Now().In(est)
//	loc, err := time.LoadLocation(
//	time :=time.Now()
	post := Post{
	Author: r.FormValue("name"), //sets Author value of post type to what the value of name box
	Message: r.FormValue("message"), //sets msg variable of post type to contents of msg box

	Posted: estTime.Format("Mon , Jan 02 03:04:05"), //set time to current time in current zone Format: DayName month date HH:MM:SS Year

	}
	ctx := appengine.NewContext(r)  //links all operations related to a given request together
	key := datastore.NewIncompleteKey(ctx, "Post", nil) //creates Unique key for request

	if _, err := datastore.Put(ctx, key, &post); err != nil { //adds the ctx to the datastore cloud
	//it can be accesed using the specific key that is generated every POST request
        log.Errorf(ctx, "datastore.Put: %v", err) //only gets here if it could not store in database
	//sends error msg and refreshes page

        w.WriteHeader(http.StatusInternalServerError)
        params.Notice = "Couldn't add new post. Try again?"
        params.Message = post.Message // Preserve their message so they can try again.
        indexTemplate.Execute(w, params)
        return
	}
	params.Posts = append([]Post{post}, params.Posts...) //the posts array is updated with the new post

	//end adding contents to database

	//getting contents from database
	q := datastore.NewQuery("Post").Order("-Posted").Limit(20) //q = last 20 posts added to database. This only a request, it HAS NOT been executed yet
	if _, err := q.GetAll(ctx, &params.Posts); err != nil { //attempt to execture the query request, if successful the posts will be appended to the Posts[]
        log.Errorf(ctx, "Getting posts: %v", err) //if fail give err msg and refresh page
        w.WriteHeader(http.StatusInternalServerError)
        params.Notice = "Couldn't get latest posts. Refresh?"
        indexTemplate.Execute(w, params)
        return
	}

	params.Notice = fmt.Sprintf("Thank you for your submission, %s!", name)
	indexTemplate.Execute(w, params)


}
func main() {
        http.HandleFunc("/", indexHandler)
        appengine.Main() // Starts the server to receive requests
}
