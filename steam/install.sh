#!/bin/bash

cd /tmp
curl -LOJ https://repo.steampowered.com/steam/archive/stable/steam_latest-stable.deb
sudo apt install ./steam_latest-stable.deb -y
cd -
