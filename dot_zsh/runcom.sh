#!/bin/bash

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# prompt theme
source "$HOME/.zsh/themes/powerlevel10k.sh"

# keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# completions
zstyle ":completion:*" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path "$HOME/.zsh/cache"
zstyle ":completion:*" matcher-list "" \
  "m:{a-z\-}={A-Z\_}" \
  "r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}" \
  "r:|?=** m:{a-z\-}={A-Z\_}"
zstyle ":completion:*:git-checkout:*" sort false
zstyle ":completion:*:descriptions" format "[%d]"
zstyle ":fzf-tab:*" switch-group "," "."
zstyle ":fzf-tab:complete:cd:*" fzf-preview "exa -1 --color=always $realpath"
zstyle ":fzf-tab:complete:exa:*" fzf-preview "exa -1 --color=always $realpath"

# directory jump
alias d="dirs -v"
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# history
export SAVEHIST=1000000000
export HISTSIZE=1000000000
export HISTFILE="$HOME/.zsh/history"
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS
