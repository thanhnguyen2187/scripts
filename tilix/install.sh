#!/bin/bash

sudo apt install tilix
sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper
sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
