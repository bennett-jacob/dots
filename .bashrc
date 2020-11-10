export OSH=$HOME/.oh-my-bash

OSH_THEME="mortalscumbag"

completions=(
  git
  ssh
)

aliases=(
  general
)

plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias l="ls -laph"
alias gac="git add . && git commit"
alias c="clear"
alias sourceme="source ~/.bashrc"
alias dco="docker-compose"

# load other aliases
[ -s "$HOME/.aliases" ] && source "$HOME/.aliases"

# ------------------------------------------------------------------------------
# Environment configurations
# ------------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
