#!/bin/bash

# Update the repositories
sudo apt update

# Provision and source code version management
sudo apt install \
    git \
    tig \
    pipx \
    ansible \
    boxes \
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
