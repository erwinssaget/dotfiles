# Start tmux
if [ "$TMUX" = "" ]; then tmux a; fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh"

# Autocomplete
autoload -Uz compinit && compinit

# TERM
export TERM=xterm-256color

# This is for the prompt
source ~/Code/dotfiles/git-prompt.sh

# Prompt
GIT_PS1_SHOWCOLORHINTS=true
NEWLINE=$'\n'
precmd () { __git_ps1 "%~%s" "${NEWLINE}$ " }

# Aliases
alias gst="git status"
alias codedir="cd ~/Code"

# Functions
# this can also be achieved by the same command
# docker system prune --volumes
function docker-clean() {
  docker image prune -a --force;
  docker container prune --force;
  docker volume prune --force;
  docker network prune;
}

function docker-mysql() {
  docker run --name mysql -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -p 3306:3306 -d mysql
}

function start() {
  case "$1" in
    mysql)
      docker start mysql
      ;;
    *)
      echo "Usage: $0 {mysql}"
      ;;
  esac
}

function stop() {
  case "$1" in
    mysql)
      docker stop mysql
      ;;
    *)
      echo "Usage: $0 {mysql}"
      ;;
  esac
}
