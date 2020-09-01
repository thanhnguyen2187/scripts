#!/bin/bash

# install zsh
sudo apt install zsh
chsh -s $(which zsh)

# install Oh My Zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh
