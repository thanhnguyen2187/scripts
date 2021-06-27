#!/bin/bash

VERSION=$1

rm -f /tmp/ripgrep.deb
curl -LJ "https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/ripgrep_${VERSION}_amd64.deb" -o /tmp/ripgrep.deb
sudo apt install /tmp/ripgrep.deb
