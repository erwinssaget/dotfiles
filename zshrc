# Path to your oh-my-zsh installation.
export ZSH="/Users/erwinssaget/.oh-my-zsh"

ZSH_THEME="arrow"

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

# To use Docker buildkit
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# Aliases
alias gst="git status"
alias codedir="cd ~/Code"
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
export CODE="/Users/erwinssaget/Code"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=($ZSH/plugins/docker)
autoload -Uz compinit; compinit

export FZF_DEFAULT_COMMAND='fd --type f'

export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

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
