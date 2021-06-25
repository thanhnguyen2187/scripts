#!/bin/bash

git clone https://github.com/cilynx/rtl88x2bu.git
cd rtl88x2bu || exit

VER=$(sed -n 's/\PACKAGE_VERSION="\(.*\)"/\1/p' dkms.conf)
sudo rsync -rvhP ./ "/usr/src/rtl88x2bu-${VER}"
sudo dkms add -m rtl88x2bu -v "${VER}"
sudo dkms build -m rtl88x2bu -v "${VER}"
sudo dkms install -m rtl88x2bu -v "${VER}"
sudo modprobe 88x2bu

cd ..
rm -rf rtl88x2bu
# remove the wireless USB Wi-fi Adapter and plug it in again
