#!/bin/zsh

ASDF_DIR="${ASDF_DIR:-$HOME/.asdf}"
if [[ -d $ASDF_DIR ]]; then
    source "${HOME}/.asdf/asdf.sh"
    fpath=(${ASDF_DIR}/completions $fpath)
fi
