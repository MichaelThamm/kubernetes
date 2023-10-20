#!/bin/bash

echo -e "\n***Creating the deployment***\n"

kubectl create secret docker-registry dockerhub-michaelthamm --docker-username=$DOCKERHUB_USER --docker-password=$DOCKERHUB_PSWD --docker-email=$DOCKERHUB_EMAIL
kubectl apply -f ./deployments/website-deployment.yml

# Start local webpage location
url="http://localhost:5000"
xdg-open $url
cmd.exe /C start "" "$url"
