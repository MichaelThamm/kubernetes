#!/bin/bash

echo -e "\n***Checking contexts and configuration***\n"
kubectl config get-contexts
kubectl get nodes --all-namespaces
kubectl get pods --all-namespaces