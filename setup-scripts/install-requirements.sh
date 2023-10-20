#/bin/bash

# Prep the virtual environment
sudo apt-get update
sudo apt-get install -y python3.10-venv
python3 -m venv venv
. venv/bin/activate

# Install linux packages
sudo apt-get install -y xdg-utils

# Install python packages
pip install mysql-connector-python
