#!/bin/zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
