#!/bin/bash

sudo apt install gpg dirmngr
bash -c "${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring"
asdf install nodejs latest:lts
asdf global nodejs lts
