#!/bin/bash

export ZDOTDIR="$HOME/.config/zsh"

if [ ! -d "$ZDOTDIR" ]; then
    mkdir -p "$ZDOTDIR"
    touch "$ZDOTDIR/.zshrc"
fi
