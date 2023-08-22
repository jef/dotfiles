#!/bin/bash

# directory
alias cat="bat"
alias l="exa -ghlH --git"
alias la="exa -aghlH --git"
alias ls="exa --git"

# docker
alias dk="docker"
alias dkc="docker-compose"

# kitty
alias icat="kitty +kitten icat"
alias kssh="kitty +kitten ssh"
alias themes="kitty +kitten themes"

# kubernetes
alias kb="kubectl"
alias kbc="kubectl config"

# editors
alias v="nvim"

# git
pretty_format="%C(cyan)%an <%ae>%C(reset) %C(blue)%ai (%ar)%C(reset)%n%C(green)%h%C(reset) %s%C(red)%d%C(reset)%n"
alias g="git"
alias gb="git branch"
alias gba="git branch --all --verbose"
alias gbc="git checkout -b"
alias gbd="git branch --delete"
alias gbD="git branch --delete --force"
alias gc="git commit"
alias gco="git checkout"
alias gcm="git commit -m"
alias gcM="git commit --allow-empty -m"
alias gcx="git clean -fd"
alias gcX="git clean -xfd"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gfap=_git_fetch_pull_prune
alias gfm="git pull"
alias gia="git add"
alias gid="git diff --no-ext-diff --cached"
alias gidt="git difftool --no-ext-diff --cached"
alias giD="git diff --no-ext-diff --cached --word-diff"
alias giDt="git difftool --no-ext-diff --cached --word-diff"
alias gix="git rm -r --cached"
alias giX="git rm -rf --cached"
alias gl='git log --topo-order --pretty=format:"${pretty_format}"'
alias glc="git shortlog --summary --numbered"
alias gls='git log --topo-order --stat --pretty=format:"${pretty_format}"'
alias gm="git merge"
alias gma="git merge --abort"
alias gp="git push"
alias gpa="git push --all"
alias gpc=_git_push_set_upstream_current_branch
alias gpf="git push --force-with-lease"
alias gpt="git push --tags"
alias gr="git restore"
alias grs="git restore --staged"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbi="git rebase --interactive"
alias grbc="git rebase --continue"
alias gs="git switch"
alias gsc="git switch -c"
alias gsC="git switch -C"
alias gst="git stash"
alias gsf=_git_sync_fork
alias gstp="git stash pop"
alias gsts="git stash save --include-untracked"
alias gstx="git stash drop"
alias gstX="git stash clear"
alias gwd="git diff --no-ext-diff"
alias gwdt="git difftool --no-ext-diff"
alias gwD="git diff --no-ext-diff --word-diff"
alias gwDt="git difftool --no-ext-diff --word-diff"
alias gws="git status --ignore-submodules=none --short"
alias gwS="git status --ignore-submodules=none"

# system
alias rm="rm -i"

# vscode
alias sudocode='sudo code --user-data-dir=${HOME}/.vscode-root'
