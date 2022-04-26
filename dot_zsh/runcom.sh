#!/bin/bash

# prompt theme
source "$HOME/.zsh/themes/prompt.sh"

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
