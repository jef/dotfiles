#!/bin/bash

_git_fetch_pull_prune() {
    git fetch --all --prune --prune-tags --tags --force
    git branch --verbose | grep "\[gone\]" | awk '{print $1}' | xargs git branch --delete --force
    git pull
}
