#!/bin/bash

. ./setup-scripts/install-requirements.sh
. ./setup-scripts/set-env.sh
./setup-scripts/validate-kube-config.sh
./setup-scripts/deploy-website.sh
./setup-scripts/deploy-mysql.sh

python3 ./python/write-to-db.py
# echo "Script finished, thanks for joining"