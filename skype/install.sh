#!/bin/bash

cd /tmp || exit
curl -LOJ https://go.skype.com/skypeforlinux-64.deb
sudo apt install ./skypeforlinux-64.deb

