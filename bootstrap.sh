#!/bin/bash

sudo apt install \
    git \
    build-essential \
;
git clone https://github.com/thanhnguyen2187/scripts
git clone https://github.com/thanhnguyen2187/.dotfiles ~/.dotfiles
cd scripts || exit
./rust/install.sh
./just/install.sh
