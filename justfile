provision:
    ./essentials/install.sh
    ./poetry/install.sh
    ./bat/install.sh 0.18.1
    ./ripgrep/install.sh 13.0.0
    ./zsh/install.sh
    ./tmux/install.sh
    ./mackup/install.sh
    ./vim/install.sh
    ./docker/install.sh
    ./asdf/install.sh
    ./asdf/install-nodejs.sh
    ./github-cli/install.sh

provision-extended: provision
    ./utilities/install.sh
    ./nerdfonts/install.sh JetBrainsMono 2.1.0
    ./firefox/hide-tabs.sh
    ./jetbrains-toolbox/install.sh
    ./skype/install.sh

install-nerdfonts-ubuntu:
    ./nerdfonts/install.sh Ubuntu 2.1.0
    ./nerdfonts/install.sh UbuntuMono 2.1.0

update-dotfiles:
    git -C ~/.dotfiles pull

create-new-script FOLDER NAME:
    mkdir -p {{FOLDER}}
    echo "#!/bin/bash" > {{FOLDER}}/{{NAME}}.sh
    chmod +x {{FOLDER}}/{{NAME}}.sh
