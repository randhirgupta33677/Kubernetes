#!/bin/bash

# Check architecture and download kind
if [ "$(uname -m)" = "x86_64" ]; then
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
  chmod +x ./kind
  sudo cp ./kind /usr/local/bin/kind
  rm -f ./kind
fi

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
