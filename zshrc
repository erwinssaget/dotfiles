# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gozilla"

#path=($path)

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Use vim keybindings =)
bindkey -v
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git vi-mode kubectl)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Aliases
alias gst="git status"
alias dc="docker-compose"
alias dcu="dc up"
alias dcd="dc down"
alias gcm="git checkout main"
alias gcd="git checkout develop"
alias gco="git checkout"
alias dl="cd ~/Downloads"
alias reload="exec zsh"
alias docs="cd ~/Documents"
alias vim="vim"
alias ws="cd ~/Code"
alias ci="composer install"
alias art="php artisan"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="/Users/erwinssaget/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/Users/erwinssaget/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"


# Herd injected PHP binary.
export PATH="/Users/erwinssaget/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/erwinssaget/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 8.4 configuration.
export HERD_PHP_84_INI_SCAN_DIR="/Users/erwinssaget/Library/Application Support/Herd/config/php/84/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/erwinssaget/Library/Application Support/Herd/config/php/83/"
