#!/bin/bash

# Provision and source code version management
sudo apt install \
    git \
    tig \
    pipx \
    ansible \
    boxes \
    python3-venv \
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
