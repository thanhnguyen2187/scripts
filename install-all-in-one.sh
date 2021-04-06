#!/bin/bash

sudo apt update


##############
# Essentials #
##############

sudo apt install \
    libtool \
    autoconf \
    automake \
    tig \
    python3-dev \
    python3-venv \
    python3-jedi \
    pipx \
    vim \
    neovim \
    autojump \
    graphviz \
    -y


###################
# Other Utilities #
###################

sudo apt install \
    curl \
    jq \
    htop \
    neofetch \
    hugo \
    variety \
    gnome-tweak-tool \
    -y
    # gnome-shell-pomodoro \

sudo snap install \
    spotify \
    telegram-desktop
# sudo snap intall code --classic
sudo snap install \
    go \
    code \
    emacs \
    espanso \
    --classic


########################
# Wi-fi Adapter Driver #
########################

read -p "Do you want to install Wi-fi Adapter Driver (rtl88x2bu)? " choice
case "$choice" in 

  y|Y|yes|Yes )
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
    read -p "Please remove the wireless USB Wi-fi Adapter and plug it in again."
  ;;

  # n|N ) echo "no";;
  * ) echo "Wi-fi Adapter Driver (rtl88x2bu) installation skipped.";;
esac


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
curl -L https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2020.03.04_amd64.deb -o dropbox.deb
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

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh


##########
# Poetry #
##########

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | \
    python3
source $HOME/.poetry/env

zsh -c 'mkdir $ZSH/plugins/poetry'
zsh -c 'poetry completions zsh > $ZSH/plugins/poetry/_poetry'


##########
# NodeJS #
##########

# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash completion

# nvm install --lts


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


#############
# NerdFonts #
#############

cd /tmp
rm ./JetBrainsMono.zip
curl -LOJ https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip -d ./fonts
mkdir -p ~/.local/share/fonts
cp ./fonts/* ~/.local/share/fonts/
fc-cache -f -v


#############
# Alacritty #
#############

echo | sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty


#############
# GitHubCLI #
#############

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh


###########
# Firefox #
###########

echo "#######################################################################"
echo "# Please enable legacy custom style of Firefox after the operation... #"
echo "#######################################################################"
read -p ""

cd $HOME/.mozilla/firefox/*.default-release
mkdir -p chrome
tee -a chrome/userChrome.css <<-EOF
#TabsToolbar { visibility: collapse !important; }
EOF
cd -


##########
# Notion #
##########

cd /tmp
curl https://raw.githubusercontent.com/puneetsl/lotion/master/setup.sh > ./setup.sh
chmod +x ./setup.sh
./setup.sh install
rm ./setup.sh
cd -


#####################
# JetBrains Toolbox #
#####################

cd /tmp
curl -LJ https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.19.7784.tar.gz -o jetbrains-toolbox.tar.gz
tar -xvf ./jetbrains-toolbox.tar.gz
cd ./jetbrains-toolbox-1.19.7784
./jetbrains-toolbox
cd -


########
# Anki #
########

cd /tmp
curl -LJ https://github.com/ankitects/anki/releases/download/2.1.38/anki-2.1.38-linux.tar.bz2 -o anki.tar.bz2
tar xjf ./anki.tar.bz2
cd anki-2.1.38-linux/
sudo ./install.sh
cd -


#########
# Skype #
#########

cd /tmp
curl -LOJ https://go.skype.com/skypeforlinux-64.deb
sudo apt install ./skypeforlinux-64.deb
cd -


###############
# NVM and NPM #
###############

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash completion

nvm install --lts


###############
# DotNet Core #
###############

cd /tmp

wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo apt install ./packages-microsoft-prod.deb

rm packages-microsoft-prod.deb

sudo apt update
sudo apt install apt-transport-https \
    dotnet-sdk-5.0 \
    -y

dotnet install --global dotnet-ef
dotnet tool install --global Microsoft.Web.LibraryManager.Cli

cd -


##################
# Vim and Neovim #
##################

sudo apt install vim \
    nvim \
    -y
# 3 should be correlated to nvim
# echo 3 | sudo update-alternatives --config editor
nvim --headless +PlugInstall +UpdateRemotePlugins +qa


##########
# Chrome #
##########

cd /tmp

curl -LOJ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

cd -


##################
# Sqlite Browser #
##################

sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
sudo apt update
sudo apt install sqlitebrowser


##########
# Docker #
##########

sudo apt update && \
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt install \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose \
    -y


############
# Obsidian #
############

mkdir -p $HOME/Applications

curl -LJ \
https://github.com/obsidianmd/obsidian-releases/releases/download/v0.10.11/Obsidian-0.10.11.AppImage \
    -o $HOME/Applications/Obsidian.AppImage

tee ~/.local/share/applications/Obsidian.desktop &> /dev/null <<EOF
[Desktop Entry]
Name=Obsidian
Exec=$HOME/Applications/Obsidian.AppImage
StartupNotify=true
StartupWMClass=obsidian
Terminal=false
Type=Application
EOF


########
# ASDF #
########

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
cd ~/.asdf
git checkout "$(git describe --abbrev=0 --tags)"

# for asdf-nodejs

sudo apt install gpg dirmngr
bash -c "${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring"
asdf install nodejs latest:lts
asdf global nodejs lts
