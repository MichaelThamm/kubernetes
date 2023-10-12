#!/bin/bash

. ./setup-scripts/set-env.sh
./setup-scripts/validate-kube-config.sh
latest_tag=$("./setup-scripts/get-latest-app-tag.sh")
./setup-scripts/create-deployment.sh "$latest_tag"
echo "Script finished, thanks for joining"