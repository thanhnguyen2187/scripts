#!/bin/bash

VERSION=$1

rm -f /tmp/bat.deb
curl -LJ "https://github.com/sharkdp/bat/releases/download/v${VERSION}/bat_${VERSION}_amd64.deb" -o /tmp/bat.deb
sudo apt install /tmp/bat.deb
