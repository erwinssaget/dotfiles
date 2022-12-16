# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Use vim keybindings =)
bindkey -v
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Aliases
alias gst="git status"
alias dc="docker-compose"
alias dcu="dc up"
alias dcd="dc down"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gco="git checkout"
alias dl="cd ~/Downloads"
alias reload="source ~/.zshrc"
alias docs="cd ~/Documents"
alias vim="nvim"
alias ws="cd ~/Code"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
