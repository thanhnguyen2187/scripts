#!/bin/bash

cd /tmp
curl -LJ https://dl.min.io/client/mc/release/linux-amd64/mcli_20210422174000.0.0_amd64.deb -o mcli.deb
sudo apt install ./mcli.deb
