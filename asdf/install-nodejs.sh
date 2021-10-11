#!/bin/bash

sudo apt install gpg dirmngr
asdf plugin add nodejs

bash -c "${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring"

asdf install nodejs latest:lts
asdf global nodejs lts
