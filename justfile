provision:
    ./essentials/install.sh
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
    ./nerdfonts/install.sh JetBrainsMono v2.1.0
    ./firefox/hide-tabs.sh
    ./jetbrains-toolbox/install.sh
    ./skype/install.sh

install-nerdfonts-ubuntu:
    ./nerdfonts/install.sh Ubuntu v2.1.0
    ./nerdfonts/install.sh UbuntuMono v2.1.0

create-new-script FOLDER NAME:
    mkdir -p {{FOLDER}}
    echo "#!/bin/bash" > {{FOLDER}}/{{NAME}}.sh
    chmod +x {{FOLDER}}/{{NAME}}.sh
