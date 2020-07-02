autoload -Uz compinit && compinit

source "$HOME/.zsh_plugins.sh"
source "$HOME/.alias"
source "$HOME/.environment"
source "$HOME/.function"
source "$HOME/.runcom"
source "$HOME/.specific"

# Dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
