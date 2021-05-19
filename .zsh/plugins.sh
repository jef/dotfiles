#!/bin/sh

if ! zgenom saved; then
  zgenom load Aloxaf/fzf-tab
  zgenom load zsh-users/zsh-syntax-highlighting
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-history-substring-search
  zgenom load bazelbuild/bazel scripts/zsh_completion
  zgenom load docker/cli contrib/completion/zsh
  zgenom load docker/compose contrib/completion/zsh
  zgenom load zsh-users/zsh-completions
  zgenom load djui/alias-tips
  zgenom load ael-code/zsh-colored-man-pages
  zgenom load romkatv/powerlevel10k powerlevel10k
  zgenom load "${HOME}/.zsh/plugins/asdf.plugin.zsh"

  zgenom save
fi
