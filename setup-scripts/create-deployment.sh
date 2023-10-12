#!/bin/bash

echo -e "\n***Creating the deployment***\n"

# Create the website deployment
latest_tag="$1"
deployment_name="demo-website"
kubectl create secret docker-registry dockerhub-michaelthamm --docker-username=$DOCKERHUB_USER --docker-password=$DOCKERHUB_PSWD --docker-email=$DOCKERHUB_EMAIL
kubectl create deployment "$deployment_name" --image=michaelthamm/website:$
pod_name=$(kubectl get pods -l app="$deployment_name" -o=name | awk -F/ '{print $2}')

# Start local webpage location
url="http://localhost:5000"
xdg-open $url
cmd.exe /C start "" "$url"

# Enable the port forwarding to local host
kubectl port-forward pod/"$pod_name" 5000:5000 &
