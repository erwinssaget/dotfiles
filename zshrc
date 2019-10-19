source ./git-prompt.sh

# use more powerful autocomplete
autoload -Uz compinit && compinit

NEWLINE=$'\n'
PROMPT="%~ ${NEWLINE}$ "
alias gst="git status"
alias codedir="cd ~/Code"
