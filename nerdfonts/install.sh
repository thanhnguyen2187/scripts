#!/bin/bash

cd /tmp
rm ./JetBrainsMono.zip
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -LOJ
unzip JetBrainsMono.zip -d ./fonts
mkdir -p ~/.local/share/fonts
cp ./fonts/* ~/.local/share/fonts/
fc-cache -f -v
