#!/bin/bash

sudo apt build-dep emacs
sudo apt install \
    texinfo \
    libx11-dev \
    libxpm-dev \
    libjpeg-dev \
    libpng-dev \
    libgif-dev \
    libtiff-dev \
    libgtk-3-dev \
    libncurses-dev \
    libgnutls28-dev \
;

cd /tmp
git clone git://git.savannah.gnu.org/emacs.git
cd emacs/
./autogen.sh
./configure --with-native-compilation
make -j$(nproc)
sudo make install

