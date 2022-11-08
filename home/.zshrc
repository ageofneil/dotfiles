# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path to scripts
export PATH="$HOME/dotfiles/scripts:$PATH"

# need to disable in order for exa ls alias to work
DISABLE_LS_COLORS="true"
ZSH_THEME="robbyrussell"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# plugins
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
)

# aliases
if [ -f ~/.aliases ]; then
        . ~/.aliases
fi


source $ZSH/oh-my-zsh.sh


# pyenv stuff
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# set starship as prompt
eval "$(starship init zsh)"