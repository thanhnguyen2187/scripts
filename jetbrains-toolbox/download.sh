#!/bin/bash

VERSION=$1

curl -LJ "https://download.jetbrains.com/toolbox/jetbrains-toolbox-${VERSION}.tar.gz" \
    -o /tmp/jetbrains-toolbox.tar.gz
tar -xvzf /tmp/jetbrains-toolbox.tar.gz
