# Path to your oh-my-zsh installation.
export ZSH="/Users/erwinssaget/.oh-my-zsh"

ZSH_THEME="theunraveler"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Use vim keybindings =)
bindkey -v
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git docker docker-machine vi-mode fzf nvm pip)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# To use Docker buildkit
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

export CODE="~/workspace"

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
alias knex="node_modules/.bin/knex"
alias docs="cd ~/Documents"
alias zshrc="vim ~/.zshrc"
alias ws="cd $CODE"
alias nr="npm run"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=($ZSH/plugins/docker)
autoload -Uz compinit; compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/erwinssaget/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/erwinssaget/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/erwinssaget/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/erwinssaget/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
