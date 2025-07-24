#!/bin/bash

# Install Docker if not already installed
sudo apt-get update
sudo apt-get install -y docker.io

# Add user to docker group
sudo usermod -aG docker $USER

# Reload group membership (optional: may not work in non-interactive shells)
newgrp docker

# Proceed with kind + kubectl install...

echo "Docker Installed Sucessfully ! Proceed with k8S installation"
