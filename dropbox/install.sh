#!/bin/bash

cd /tmp/ || exit
curl -L https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb -o dropbox.deb
sudo apt install python3-gpg
sudo apt install ./dropbox.deb
