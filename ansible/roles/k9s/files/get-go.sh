#!/bin/bash

# Fetch the latest version number from the Go website
LATEST_VERSION=$(curl -s https://golang.org/VERSION?m=text)

# Define the URL for the latest tarball
TAR_URL="https://golang.org/dl/${LATEST_VERSION}.linux-amd64.tar.gz"

# Download the latest tarball
wget $TAR_URL -O /tmp/go_latest.tar.gz

# Remove any previous Go installation
sudo rm -rf /usr/local/go

# Extract the new tarball to /usr/local
sudo tar -C /usr/local -xzf /tmp/go_latest.tar.gz

# Clean up the tarball
rm /tmp/go_latest.tar.gz

# Ensure /usr/local/go/bin is in PATH
if ! grep -q "/usr/local/go/bin" ~/.bashrc; then
  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
fi

# Reload the shell configuration
source ~/.bashrc

# Verify the installation
go version
