#!/bin/bash

# cloc
cloc-git() {
    _temp_dir=$(mktemp -d)/git-repo
    git clone --depth 1 "$1" "$_temp_dir"
    printf "Note: %s will be deleted automatically.\n\n" "$_temp_dir"
    cloc "$_temp_dir"
    rm -rf "$_temp_dir"
}

# github 
_git_fetch_pull_prune() {
    git fetch --all --prune --prune-tags --tags --force
    git branch --verbose | grep "\[gone\]" | awk '{print $1}' | xargs git branch --delete --force
    git pull
}

_git_push_set_upstream_current_branch() {
    git push --set-upstream origin "$(git rev-parse --abbrev-ref HEAD)" "$@"
}

_git_sync_fork() {
    _git_fetch_pull_prune

    local branch
    if [ "$1" ]; then
        branch="$1"
    else
        branch="main"
    fi

    git merge "upstream/$branch"
}

trigger() {
    local branch
    if [ "$1" ]; then
        branch="$1"
    else
        branch="main"
    fi

    branch_name="chore/trigger"
    commit_message="chore: trigger deployment

Ref: ${2}"
    pr_assignee="jef"
    pr_body="### Description

Triggers deployment based on ${2}"
    pr_label=""
    pr_title="chore: trigger deployment"

    echo "checking out $1 and pruning local"

    git checkout "$1" > /dev/null 2>&1
    _git_fetch_pull_prune > /dev/null 2>&1

    git branch --delete --force "$branch_name" > /dev/null 2>&1
    git push origin --delete "$branch_name" > /dev/null 2>&1
    git checkout -b "$branch_name" > /dev/null 2>&1

    echo "creating commit and pr"

    git commit --allow-empty \
        --message "$commit_message" \
        --no-verify > /dev/null 2>&1
    _git_push_set_upstream_current_branch --no-verify > /dev/null 2>&1

    gh pr create \
        --assignee "$pr_assignee" \
        --title "$pr_title" \
        --body "$pr_body" \
        --label "$pr_label" > /dev/null 2>&1
    gh pr view

    git checkout "$branch"
}

# system
print_unicode() {
    echo "↘ ↗ ✖ ✔ ℹ"
}

test_font() {
    echo -e "regular"
    echo -e "\e[1mbold\e[0m"
    echo -e "\e[3mitalic\e[0m"
    echo -e "\e[3m\e[1mbold italic\e[0m"
    echo -e "\e[4munderline\e[0m"
    echo -e "\e[9mstrikethrough\e[0m"
    echo -e "\e[31mHello World\e[0m"
    echo -e "\x1B[31mHello World\e[0m"
    echo
}
