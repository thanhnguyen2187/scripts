#!/bin/bash

sudo add-apt-repository ppa:plt/racket
sudo apt update
sudo apt install racket

raco pkg install sicp
