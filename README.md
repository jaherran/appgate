# Appgate
This repository ilustrate how to create a flask application, use gunicorn to bring the python application ready for production and then adding nginx for its communication to outside world as well as load balancing the service.
This repo also includes the dockerfiles to build the containers for each portion of the app, frontend (nginx container) and backend (gunicorn+flask container), then it also would include the kubernetes .yaml files to deploy the application to kubernetes cluster.
For easy testing purposes it has been tested in minikube environment running in windos11(wsl ubuntu20.04)

The solution for the problem in the test is this one:
# For testing flask application execution, from the directory helloflask do:
```export FLASK_APP="src.app:flask_app()"```
```flask run```
Then you can test the app at: http://127.0.0.1:5000
# For testing gunicorn application passing the variable testing in False, do:
```gunicorn --preload -w 4 "app.src.app:flask_app(testing=False)"```
Then you can test the app at: http://127.0.0.1:8000
# Allow live changes to application
```gunicorn --reload -w 4 "app.src.app:flask_app(testing=False)"```
if apply any change to the app.py it gets automatically applied by the reload
# To force use the same port as original flask app do:
```gunicorn -b localhost:5000 -w 4 "app.src.app:flask_app(testing=True)"```
Then you can test the app at: http://localhost:5000/
# To Build the image from docker compose (there are setup the dockerhub tags)
```docker compose build helloflask```
# If you wnat to test the image you can do
```docker compose up helloflask```
# To push the image
```docker push zelfick/helloflask:1.0```
# Kubernetes base files, placed in /kuber folder
There were created a .yml file which include the deployment and the service because both of them are tightly related
# Apply the deployment to the default namespace
```kubectl apply -f ./kuber/helloflask.yaml```
# To be able to connect to service from using your local host execute in minikube
minikube service flasknginx-service --url
then go to that url, or from other terminal execute: curl generated_ip:generated_port

note:There is another approach to the solution look into /flasknginx/README.md for its own instructions