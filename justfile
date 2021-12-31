provision:
    ./essentials/install.sh
    ./nerdfonts/install.sh JetBrainsMono 2.1.0
    ./bat/install.sh 0.18.1
    ./ripgrep/install.sh 13.0.0
    ./zsh/install.sh
    ./tmux/install.sh
    ./mackup/install.sh
    # ./vim/install.sh
    ./docker/install.sh
    ./github-cli/install.sh
    ./asdf/install.sh
    ./asdf/install-nodejs.sh
    ./asdf/install-java.sh
    ./asdf/install-python.sh

provision-extended:
    ./utilities/install.sh
    ./firefox/hide-tabs.sh
    ./jetbrains-toolbox/download.sh 1.21.9712
    # ./skype/install.sh

update-dotfiles:
    git -C ~/.dotfiles pull

create-new-script FOLDER NAME:
    mkdir -p {{FOLDER}}
    echo "#!/bin/bash" > {{FOLDER}}/{{NAME}}.sh
    chmod +x {{FOLDER}}/{{NAME}}.sh
