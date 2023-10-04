#!/bin/bash

_git_sync_fork() {
    _git_fetch_pull_prune

    local branch
    if [ "$1" ]; then
      branch="$1"
    else
      branch="main"
    fi

    git merge "upstream/${branch}"
}