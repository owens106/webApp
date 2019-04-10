package main
import (
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
type templateParams struct {
        Notice string
        Name   string
	Message string
	Posts []Post   //stores an array of posts types
}
type Post struct {
	Author string //variable for name field
	Message string //variable for messg field
	Posted time.Time //stores date and time of message
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

	name := r.FormValue("name")
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

	// TODO: save the message into a database.
	post := Post{
	Author: r.FormValue("name"), //sets Author value of post type to what the value of name box
	Message: r.FormValue("message"), //sets msg variable of post type to contents of msg box
	Posted: time.Now(), //set time to current time

	}
	ctx := appengine.NewContext(r)  //links all ops related to a given request together
	key := datastore.NewIncompleteKey(ctx, "Post", nil) //creates Unique key for request

	if _, err := datastore.Put(ctx, key, &post); err != nil { //adds the context to the datastore cloud
	//it can be accesed using the specific key that is generated every POST request
        log.Errorf(ctx, "datastore.Put: %v", err)

        w.WriteHeader(http.StatusInternalServerError)
        params.Notice = "Couldn't add new post. Try again?"
        params.Message = post.Message // Preserve their message so they can try again.
        indexTemplate.Execute(w, params)
        return
	}
	params.Posts = append([]Post{post}, params.Posts...) //the posts array is updated with the new post
	params.Notice = fmt.Sprintf("Thank you for your submission, %s!", name)
	indexTemplate.Execute(w, params)


}
func main() {
        http.HandleFunc("/", indexHandler)
        appengine.Main() // Starts the server to receive requests
}
