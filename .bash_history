ls
pico README-cloudshell.txt 
cd ..
ls
cd ..
ls
cd ..
ls
cd root/
ls
git clone     https://github.com/GoogleCloudPlatform/python-docs-samples
cd     python-docs-samples/appengine/standard_python37/hello_world
cat main.py
cat app.yaml
virtualenv --python python3     ~/envs/hello_worldvirtualenv --python python3     ~/envs/hello_worldsource     ~/envs/hello_world/bin/activatesource     ~/envs/hello_world/bin/activatesource     ~/envs/hello_world/bin/activatepip install -r requirements.txt
pip install -r requirements.txtpip install -r requirements.txt
virtualenv --python python3     ~/envs/hello_world
source     ~/envs/hello_world/bin/activate
pip install -r requirements.txt
python main.py
gcloud app create
gcloud app deploy app.yaml --project     purdue-cs252-owens106-lab6
ls
pico main.py
pico app.yaml 
pico requirements.txt 
pico app.yaml 
pico index.html
gcloud app deploy
pico app.yaml 
gcloud app deploy
ls
cd ..
ls
cd ..
ls
git clone     https://github.com/GoogleCloudPlatform/golang-samples
cd     golang-samples/appengine/go11x/helloworld
cat helloworld.go
cat app.yaml 
go run .
gcloud app create
gcloud app deploy
ls
pico helloworld.go
cd ~
ls
pico app.yaml
go get -u google.golang.org/appengine/...
mkdir $GOPATH/src/go-app
ls
envs
cat envs
cd envs
ls
cat hello_world/
cd hello_world/
ls
cd ..
ls
rm app.yaml 
rm -rf golang-samples/
rm -rf python-docs-samples/
ls
pico app.yaml
pico main.go
dev_appserver .py app.yaml 
dev_appserver.py app.yaml 
ls
pico app.yaml 
pico main.go 
dev_appserver.py app.yaml
gcloud app deploy
gcloud app browse
pico main.go 
gcloud app deploy
gcloud app browse
pico index.html
mkdir static
cd static/
ls
pico style.css
ls
cd ..
ls
cd ..
ls
cd ..
ls
cd bin
ls
cd ~
ls
cd static
wget https://raw.githubusercontent.com/GoogleCloudPlatform/golang-samples/master/appengine/gophers/gophers-2/static/gcp-gopher.svg
ls
cd ..
pico app.yaml 
pico main.go 
gcloud app deploy
dev_appserver.py app.yaml
gcloud app deploy 
gcloud app browse 
ls
pico index.html 
pico app.yaml 
pico main.go 
git
git init
git add
git add .
git commit
git config --global user.email "owens106@purdue.edu"
git config --global user.name Colin Owens
git commit
git commit initial commit
git commit "initial commit"
git commit
gitk
git log
git commit -m <2nd commit test>
git commit -m "2nd commit test"
git add .
git commit -m "2nd commit test"
git remote add origin git@github.com:owens106/cs252Lab6
git push -u origin master
git remote add origin https://github.com/owens106/cs252Lab6
git push -u origin master
git remote
git remote rm origin
git remote add origin https://github.com/owens106/cs252Lab6
git push -u origin master
ls
git commit -m "test 3rd commit"
git add .
git commit -m "test 3rd commit"
git push
git push -u origin master
git pull
git pull origin
git pull origin 1
git init
git add .
ls
git commit
git commit -m "git cleanup"
git log
git remote add origin https://github.com/owens106/webApp.git
git push -u origin master
gitk
git log
git show
git commit -m "testing still"
git add .
git commit -m "testing still"
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/owens106/webApp.git
git remote
git remote rm origin
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/owens106/webApp.git
git push -u origin master
git add .
git commit -m "git connected to github, current project is just a static webpage"
git push 
git add .
git commit -m "testing come git"
git add .
git commit -m "still testing git"
git push
pico main.go 
gcloud app deploy
gcloud app browse 
git add .
git commit -m "added a name and message field, makes for dynamic html"
git push
exit
gcloud app deploy
gcloud app browse
pico main.go 
git commit -m "store messages in local array"
git add .
git commit -m "store messages in local array"
pico main.go 
git add .
git commit -m "Post request values are stored in post struct"
pico main.go 
git add .
git commit -m "Posts are now stored with Unique key in cloud store"
pico main.go 
git add .
git commit -m "Added a Query request for the past 20 posts sent to cloud, exectued that request and results are appended to the posts[]"
pico index.
pico index.html
git add .
git commit -m "20 most recent msgs are displayed on page"
git push
gcloud app deploy
gcloud app browse 
pico index.html 
pico app.yaml 
pico main.go 
pico index.html
gcloup app deploy
gcloud app deploy
gcloud app browse 
git add .
git commit -m "fixed html syntax error for printing posted time"
pico main.go 
pico index.html
pico main.go 
pico index.html
dev_appserver.py
dev_appserver.py app.yaml 
gcloud app deploy
gcloud app browse 
pico main.go 
gcloud app deploy
pico main.go 
go tool compile main.go
gcloud app deploy
pico main.go 
gcloud app deploy
pico main.go 
gcloud app deploy
gcloud app browse 
git add .
git commit -m "formated time, need to change timezone and reformat time"
pico main.go 
gcloud app deploy
pico main.go 
gcloud app deploy
pico main.go 
gcloud app deploy
pico main.go 
gcloud app deploy
pico main.go 
gcloud app deploy
pico main.go 
gcloud app deploy
gcloud app browse 
git add .
git commit -m "changed time to EST zone, updated formating"
pico main.go 
gcloud app deploy
gcloud app browse 
pico main.go 
gcloud app deploy
gcloud app browse
pico main.go 
gcloud app browse
gcloud app deploy
gcloud app browse 
gitadd .
git add .
git commit -m "Time reformated again...prints 4 hours ahead..."
pico main.go 
git push
exit
gcloud app deploy
gcloud app browse 
git log
gcloud app deploy
gcloud app browse 
pico main.go 
gcloud app browse 
gcloud app deploy
gcloud app browse 
pico main.go 
gcloud app deploy
gcloud app browse 
pico main.go 
gcloud app deploy
gcloud app browse 
git add .
git comit -m "Finally got the time output to be EDT instead of EST"
git commit -m "Finally got the time output to be EDT instead of EST"
pico main.go
go get -u firebase.google.com/go
pico main.go 
pico index.html 
fg
nmp init
npm init
npm install --save firebase
pico main.go 
import firebase from "firebase"
pico main.go 
git commit -m "added framework for firebase"
git add .
git commit -m "added framework for firebase"
pico main.go 
pico index.html
pico main.go 
pico index.html 
git add .
git commit -m "debugged firebase framework"
pico main.go 
pico index.html
pico main.go 
pico index.html
git add .
git commit -m "added to html and CSS to account for google auth"
ls
pico index.html
pico static/
cd static/
ls
pico style.css 
cd ..
pico index.html
