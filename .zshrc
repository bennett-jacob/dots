export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="mortalscumbag"

plugins=(
    git

    # CLI syntax highlighting
    # git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    zsh-syntax-highlighting

    # Autosuggestions for commands you've used previously
    # git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    zsh-autosuggestions

    # kubectl candy
    # git clone https://github.com/superbrothers/zsh-kubectl-prompt.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-kubectl-prompt
    zsh-kubectl-prompt
)

source $ZSH/oh-my-zsh.sh

RPROMPT="%{$fg[red]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}"


# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias l="ls -laph"
alias gac="git add . && git commit"
alias c="clear"
alias sourceme="source ~/.zshrc"
alias dco="docker-compose"

# load other aliases
[ -s "$HOME/.zsh-alias" ] && source "$HOME/.zsh-alias"


# ------------------------------------------------------------------------------
# Environment configurations
# ------------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
