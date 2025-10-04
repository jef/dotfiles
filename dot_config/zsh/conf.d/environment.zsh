#!/bin/zsh

if type nvim &>/dev/null; then
    export EDITOR=nvim
    export VISUAL=nvim
else
    export EDITOR=vim
    export VISUAL=vim
fi

export HISTFILE="${HOME}/.local/share/zsh/.zsh_history"

export PATH="${PATH}:${HOME}/.local/bin"

export WORDCHARS=""
