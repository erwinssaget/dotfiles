# If you come from bash you might have to change your $PATH.
# vendor/bin:node_modules/bin:$HOME/.config/spark-installer:
export PATH="$HOME/.pyenv/shims:/usr/local/bin:$HOME/bin:$HOME/.composer/vendor/bin:`yarn global bin`:$HOME/Code/spark-installer:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/Users/erwinssaget/.oh-my-zsh

#autoload -U promptinit; promptinit

# Set name of the theme to load.
ZSH_THEME="refined"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Tmux config
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git git-flow-avh tmux sublime)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
export EDITOR='vim'

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
source ~/.aliases
# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# part of java install
export JAVA_HOME=$(/usr/libexec/java_home)

# part of android sdk install
export ANDROID_HOME=/usr/local/share/android-sdk
export HOMEBREW_GITHUB_API_TOKEN="d17b6b14fd6f6825ec26ff5fac7e3d1d129e0974"

# for zsh autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# ctrl + space to accept autosuggestions
bindkey '^ ' autosuggest-execute

# must be at the bottom of .zshrc
source /Users/erwinssaget/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

###-tns-completion-start-###
if [ -f /Users/erwinssaget/.tnsrc ]; then 
    source /Users/erwinssaget/.tnsrc 
fi
###-tns-completion-end-###
#
export PATH="/usr/local/opt/node@10/bin:$PATH"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/erwinssaget/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
