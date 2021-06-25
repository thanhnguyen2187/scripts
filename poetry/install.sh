#!/bin/bash

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | \
    python3
# shellcheck source=/dev/null
source "${HOME}/.poetry/env"

zsh -c 'mkdir $ZSH/plugins/poetry'
zsh -c 'poetry completions zsh > $ZSH/plugins/poetry/_poetry'
