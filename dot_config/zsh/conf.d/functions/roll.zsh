#!/bin/zsh

roll() {
    if [[ "$1" == (#b)([0-9]##)d([0-9]##) ]]; then
        dice="${MATCH[2]}"
        sides="${MATCH[3]}"
    else
        echo "Usage: roll XdY (e.g., 2d6)"

        return 1
    fi

    result=0

    for ((i = 0; i < dice; i++)); do
        result=$((result + RANDOM % sides + 1))
    done

    echo $result
}
