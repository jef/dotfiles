#!/bin/zsh

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
