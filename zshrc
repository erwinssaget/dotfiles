# Start tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"

# Git flow completion
source ~/.git-flow-completion.zsh

# Autocomplete
autoload -Uz compinit && compinit

# This is for the prompt
source ~/Code/dotfiles/git-prompt.sh

# Prompt
GIT_PS1_SHOWCOLORHINTS=true
NEWLINE=$'\n'
precmd () { __git_ps1 "%~%s" "${NEWLINE}$ " }

# Aliases
alias gst="git status"
alias codedir="cd ~/Code"
alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias projects="cd ~/Projects"
alias gcm="git checkout master"
alias gcd="git checkout develop"
alias gco="git checkout"
alias bearshare="cd ~/Projects/bearshare"
alias ngrok="~/ngrok"

# Functions
# this can also be achieved by the same command
# docker system prune --volumes
function docker-clean() {
  docker image prune -a --force;
  docker container prune --force;
  docker volume prune --force;
  docker network prune;
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f'

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/erwinssaget/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
