#!/bin/bash

pipx install mackup
git clone https://github.com/thanhnguyen2187/.dotfiles ~/.dotfiles
ln -s "${HOME}/.dotfiles/.mackup.cfg" "${HOME}/.mackup.cfg"
yes | pipx run mackup restore
