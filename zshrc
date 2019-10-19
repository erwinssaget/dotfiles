source ~/Code/dotfiles/git-prompt.sh

# Autocomplete
autoload -Uz compinit && compinit

# Prompt
GIT_PS1_SHOWCOLORHINTS=true
NEWLINE=$'\n'
precmd () { __git_ps1 "%~%s" "${NEWLINE}$ " }

# Aliases
alias gst="git status"
alias codedir="cd ~/Code"
