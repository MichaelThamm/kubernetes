#!/bin/bash

. ./setup-scripts/set-env.sh
./setup-scripts/validate-kube-config.sh
./setup-scripts/deploy-website.sh
./setup-scripts/deploy-mysql.sh
echo "Script finished, thanks for joining"