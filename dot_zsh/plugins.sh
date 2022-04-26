#!/bin/bash

zgenom autoupdate --no-background

if ! zgenom saved; then
  zgenom load "${HOME}/.zsh/completions"

  zgenom load Aloxaf/fzf-tab
  zgenom load docker/cli contrib/completion/zsh
  zgenom load docker/compose contrib/completion/zsh 1.29.2
  zgenom load romkatv/powerlevel10k powerlevel10k
  zgenom load zsh-users/zsh-completions
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-history-substring-search
  zgenom load zshzoo/keybindings
  zgenom load zshzoo/setopts

  zgenom load zsh-users/zsh-syntax-highlighting

  zgenom save
fi
