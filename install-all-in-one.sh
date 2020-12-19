#!/bin/bash

sudo apt update


##############
# Essentials #
##############

sudo apt install \
    git \
    tig \
    python3-venv \
    pipx \
    vim \
    neovim \
    gnome-tweak-tool \
    -y


###################
# Other Utilities #
###################

sudo apt install \
    curl \
    jq \
    htop \
    neofetch \
    -y


########################
# Wi-fi Adapter Driver #
########################

read -p "Do you want to install Wi-fi Adapter Driver (rtl88x2bu)? " choice
case "$choice" in 

  y|Y )
    sudo apt install dkms
    git clone https://github.com/cilynx/rtl88x2bu.git

    cd rtl88x2bu

    VER=$(sed -n 's/\PACKAGE_VERSION="\(.*\)"/\1/p' dkms.conf)
    sudo rsync -rvhP ./ /usr/src/rtl88x2bu-${VER}
    sudo dkms add -m rtl88x2bu -v ${VER}
    sudo dkms build -m rtl88x2bu -v ${VER}
    sudo dkms install -m rtl88x2bu -v ${VER}
    sudo modprobe 88x2bu

    cd ..
    rm -rf rtl88x2bu
  ;;

  # n|N ) echo "no";;
  * ) echo "Wi-fi Adapter Driver (rtl88x2bu) installation skipped.";;
esac
# remove the wireless USB Wi-fi Adapter and plug it in again


#######
# ZSH #
#######

sudo apt install zsh
chsh -s $(which zsh)

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh


###########
# Dropbox #
###########

cd /tmp/
curl -O https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb
sudo apt install python3-gpg
sudo apt install ./dropbox.deb
cd -
echo "#################################################################"
echo "# Please login to Dropbox before continuing the installation... #"
echo "#################################################################"
read -p ""


########
# Tmux #
########

sudo apt install tmux
pipx install tmuxp


########
# Rust #
########

echo 1 | "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"

##########
# Poetry #
##########

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | \
    python3
source $HOME/.poetry/env

zsh -c 'mkdir $ZSH/plugins/poetry'
zsh -c 'poetry completions zsh > $ZSH/plugins/poetry/_poetry'


###############
# IBUS Bamboo #
###############

sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
sudo apt update
sudo apt install ibus-bamboo
echo "Ibus Bamboo installed."
echo "Type \`ibus restart\` to reload if necessary."


##########
# Mackup #
##########

pipx install mackup
yes | pipx run mackup restore
