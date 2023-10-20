#!/bin/bash

echo -e "\n***Creating the deployment***\n"

kubectl apply -f ./deployments/mysql-deployment.yml
kubectl apply -f ./deployments/phpmyadmin-deployment.yml
# Run mysql CLI
# pod_name=$(kubectl get pods -l app="mysql" -o=name | awk -F/ '{print $2}')
# kubectl exec --stdin --tty "$pod_name" -- /bin/bash

# Start local database UI
url="http://localhost"
xdg-open $url
cmd.exe /C start "" "$url"