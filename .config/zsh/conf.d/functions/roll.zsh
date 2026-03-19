#!/bin/zsh

roll() {
    local dice sides result i
    if [[ "$1" =~ '^([0-9]+)d([0-9]+)$' ]]; then
        dice=${match[1]}
        sides=${match[2]}
    else
        echo "Usage: roll XdY (e.g., 2d6)"
        return 1
    fi

    result=0
    for ((i = 1; i <= dice; i++)); do
        result=$((result + (RANDOM % sides) + 1))
    done
    echo $result
}
