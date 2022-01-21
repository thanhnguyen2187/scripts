#!/bin/bash

sudo apt install \
    libtool \
    wget \
    autoconf \
    automake \
    build-essential \
    tig \
    python3-dev \
    python3-venv \
    python3-pip \
    python3-jedi \
    python-as-python3 \
    autojump \
    graphviz \
    curl \
    jq \
    htop \
    neofetch \
    hugo \
    -y \
;
python3 -m pip install --user pipx
