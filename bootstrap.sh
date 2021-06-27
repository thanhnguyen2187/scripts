#!/bin/bash

sudo apt install \
    git \
    build-essential \
;

rm -rf "${HOME}/.dotfiles"
git clone https://github.com/thanhnguyen2187/.dotfiles "${HOME}/.dotfiles"

git clone https://github.com/thanhnguyen2187/scripts
cd scripts || exit
./rust/install.sh
./just/install.sh
