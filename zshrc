# Path to your oh-my-zsh installation.
export ZSH="/Users/erwinssaget/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"

# Git flow completion
source ~/.git-flow-completion.zsh

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git docker docker-machine)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Aliases
alias gst="git status"
alias codedir="cd ~/Code"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gco="git checkout"
alias dl="cd ~/Downloads"
alias reload="source ~/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=($ZSH/plugins/docker)
autoload -Uz compinit; compinit

export FZF_DEFAULT_COMMAND='fd --type f'
