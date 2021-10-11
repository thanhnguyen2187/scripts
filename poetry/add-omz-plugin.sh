#!/bin/bash

# shellcheck source=/dev/null
source "${HOME}/.poetry/env"

mkdir -p "${ZSH}/plugins/poetry"
poetry completions zsh > "${ZSH}/plugins/poetry/_poetry"
