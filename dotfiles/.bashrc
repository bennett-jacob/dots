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

[ -s "$OSH/oh-my-bash.sh" ] && source "$OSH/oh-my-bash.sh"

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias l="ls -laph"
alias gac="git add . && git commit"
alias sourceme="source ~/.bashrc"

# load other aliases
[ -s "$HOME/.bash-alias" ] && source "$HOME/.bash-alias"

# ------------------------------------------------------------------------------
# Environment configurations
# ------------------------------------------------------------------------------
