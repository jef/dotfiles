#!/bin/zsh

if type hx &>/dev/null; then
    export EDITOR=hx
    export VISUAL=hx
else
    export EDITOR=vim
    export VISUAL=vim
fi

export HISTFILE="${HOME}/.local/share/zsh/.zsh_history"

export PATH="${PATH}:${HOME}/.local/bin"

export WORDCHARS=""
