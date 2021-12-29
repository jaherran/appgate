# APPGATE flask+unicorn+nginx

# Dockerbase files
# To build the image inside /flasknginx/app execute:
```docker build -f flaskgun.dockerfile -t zelfick/flaskgun .```

# To test the image locally execute
```docker run -d -p 5000:5000 zelfick/flaskgun```
# Test the interaction with the container by curl
```curl localhost:5000```
{"message":"Feliz navidad y prospero 2022!"}

# Push the application flaskgunicorn image to dockerhub
```docker push zelfick/flaskgun```

# To build the nginx image do
```docker build -f nginx.dockerfile -t zelfick/flasknginx .```

# To test the image locally execute
```docker run -p 80:80 zelfick/flasknginx```
# Test the interaction with the container by curl
```curl localhost:80```
returns /nginx/html/index.html page

# Push the nginx image to dockerhub
```docker push zelfick/flasknginx```

# Kubernetes base files, placed in /kuber folder
There were created a .yml file which include the deployment and the service because both of them are tightly related

# Apply the deployment to the default namespace
kubectl apply -f ./kuber/flasknginx.yml

# To be able to connect to service from using your local host execute in minikube
minikube service flasknginx-service --url
then go to that url, or from other terminal execute: curl generated_ip:generated_port