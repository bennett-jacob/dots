#!/bin/sh

# ------------------------------------------------------------------------------
# Install ZSH
# ------------------------------------------------------------------------------
apt-get install --upgrade zsh
chsh -s $(which zsh)

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
