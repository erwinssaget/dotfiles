# If you come from bash you might have to change your $PATH.
export PATH="/usr/local/bin:$HOME/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/erwinssaget/.oh-my-zsh

#autoload -U promptinit; promptinit

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git git-flow-avh)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
source ~/.aliases

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/erwinssaget/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# to show list of globally install npm packages
# npm list -g --depth 0
