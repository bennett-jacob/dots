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
)

source $ZSH/oh-my-zsh.sh


# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias gac="git add . && git commit"
alias l="ls -laph"
alias sourceme="source ~/.zshrc"

# load other aliases
[ -s "$HOME/.zsh-alias" ] && source "$HOME/.zsh-alias"


# ------------------------------------------------------------------------------
# Environment configurations
# ------------------------------------------------------------------------------
