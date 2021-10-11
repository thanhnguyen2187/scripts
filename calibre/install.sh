#!/bin/bash

sudo -v \
    && curl -vs https://download.calibre-ebook.com/linux-installer.sh \
    | sudo sh /dev/stdin \
;
