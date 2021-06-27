#!/bin/bash

FONTNAME=$1
VERSION=$2

rm -f "/tmp/${FONTNAME}.zip"
curl "https://github.com/ryanoasis/nerd-fonts/releases/download/v${VERSION}/${FONTNAME}.zip" -LOJ
unzip "/tmp/${FONTNAME}.zip" -d /tmp/fonts
mkdir -p ~/.local/share/fonts
cp /tmp/fonts/* ~/.local/share/fonts/
fc-cache -f -v
