# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
#

# To customize prompt, run `p10k configure` or edit ~/.zsh/themes/p10k.
[[ ! -f ~/.zsh/themes/p10k ]] || source ~/.zsh/themes/p10k
