#!/bin/bash

# Update the repositories
sudo apt update

# Text manipulation
sudo apt install \
    vim \
    code \
    -y

# Provision and source code version management
sudo apt install \
    git \
    pipx \
    ansible \
    -y

# Other utilities
sudo apt install \
    curl \
    jq \
    htop \
    neofetch \
    ranger \
    tree \
    -y

pipx install mackup
pipx run mackup restore
