#!/bin/zsh

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

    git checkout "$1" >/dev/null 2>&1
    _git_fetch_pull_prune >/dev/null 2>&1

    git branch --delete --force "$branch_name" >/dev/null 2>&1
    git push origin --delete "$branch_name" >/dev/null 2>&1
    git checkout -b "$branch_name" >/dev/null 2>&1

    echo "creating commit and pr"

    git commit --allow-empty \
        --message "$commit_message" \
        --no-verify >/dev/null 2>&1
    _git_push_set_upstream_current_branch --no-verify >/dev/null 2>&1

    gh pr create \
        --assignee "$pr_assignee" \
        --title "$pr_title" \
        --body "$pr_body" \
        --label "$pr_label" >/dev/null 2>&1
    gh pr view

    git checkout "$branch"
}
