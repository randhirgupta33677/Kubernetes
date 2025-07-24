#!/bin/bash

sudo apt update

sudo apt install -y curl wget apt-transport-https

sudo apt install -y docker.io

sudo systemctl enable --now docker

sudo usermod -aG docker $USER && newgrp docker

curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

chmod +x minikube
sudo mv minikube /usr/local/bin/

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Set version for kubectl
VERSION="v1.30.0"
URL="https://dl.k8s.io/release/${VERSION}/bin/linux/amd64/kubectl"
INSTALL_DIR="/usr/local/bin"

# Download and install kubectl
curl -LO "$URL"
chmod +x kubectl
sudo mv kubectl "${INSTALL_DIR}/"

# Verify installations
kind version
kubectl version --client

echo "kind & kubectl installation complete."
