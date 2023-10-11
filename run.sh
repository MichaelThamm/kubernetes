#!/bin/bash

kubectl config get-contexts
kubectl get pods --all-namespaces
kubectl get nodes --all-namespaces
kubectl create secret docker-registry my-secret-name --docker-username=${{secrets.DOCKER_USER}} --docker-password=${{secrets.DOCKER_PSWD}} --docker-email=DOCKERHUB_EMAIL
kubectl create deployment demo-deployment --image=michaelthamm/website:latest
kubectl get deployment
kubectl get pod