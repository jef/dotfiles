#zmodload zsh/zprof

source "$HOME/.zsh/plugins"
autoload -Uz compinit && compinit -i
source "$HOME/.zsh/alias"
source "$HOME/.zsh/environment"
source "$HOME/.zsh/function"
source "$HOME/.zsh/runcom"
source "$HOME/.zsh/specific"

# Dotfiles
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

#zprof
