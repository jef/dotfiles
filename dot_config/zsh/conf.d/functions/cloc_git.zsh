#!/bin/zsh

cloc_git() {
    local url
    local temp_dir

    url="$(git remote get-url origin)"

    [ -n "$1" ] && url="$1"

    temp_dir=$(mktemp -d)/git-repo
    git clone --depth 1 "$url" "$temp_dir"

    printf "note: %s will be deleted automatically.\n\n" "$temp_dir"

    cloc "$temp_dir"
    rm -rf "$temp_dir"
}
