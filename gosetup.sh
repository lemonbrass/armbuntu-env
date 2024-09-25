#!/bin/bash

DEFAULT_GO_VERSION=1.23.0
ARCH=arm64
OS=linux

read -p "Enter Go version to install [${DEFAULT_GO_VERSION}]: " GO_VERSION
GO_VERSION=${GO_VERSION:-$DEFAULT_GO_VERSION}  # Use default if no input is given
DOWNLOAD_URL="https://golang.org/dl/go${GO_VERSION}.${OS}-${ARCH}.tar.gz"

read -p "Wanna install Go version ${GO_VERSION} for ${ARCH} ${OS}? [Y/n] " response
response=${response,,}  # Convert to lowercase

if [[ "$response" == "y" || "$response" == "yes" || -z "$response" ]]; then
    echo "Downloading Go version ${GO_VERSION}..."
    curl -LO "${DOWNLOAD_URL}"
    
    if [ -d "/usr/local/go" ]; then
        echo "Removing previous Go installation..."
        sudo rm -rf /usr/local/go
    fi

    echo "Installing Go..."
    sudo tar -C /usr/local -xzf "go${GO_VERSION}.${OS}-${ARCH}.tar.gz"
    
    echo "Cleaning up..."
    rm "go${GO_VERSION}.${OS}-${ARCH}.tar.gz"
    
    echo "Setting up Go environment variables..."
    echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    source ~/.bashrc

    echo "Go installation completed. Verifying..."
    go version
    
    echo "Go version ${GO_VERSION} installed successfully."
else
    echo "Installation aborted."
fi
