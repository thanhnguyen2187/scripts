#!/bin/bash

FONTNAME=$1
VERSION=$2

cd /tmp || exit
rm "./${FONTNAME}.zip"
curl "https://github.com/ryanoasis/nerd-fonts/releases/download/${VERSION}/${FONTNAME}.zip" -LOJ
unzip "${FONTNAME}.zip" -d ./fonts
mkdir -p ~/.local/share/fonts
cp ./fonts/* ~/.local/share/fonts/
fc-cache -f -v
