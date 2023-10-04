#!/bin/bash

plugins=(
    romkatv/powerlevel10k
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting
)

plugins_folder="${HOME}/.local/share/zsh/plugins"
mkdir -p "$plugins_folder"

for plugin in "${plugins[@]}"; do
    plugin_name="${plugin##*/}"

    if [[ ! -d "${plugins_folder}/${plugin_name}" ]]; then
        git clone "https://github.com/${plugin}.git" "${plugins_folder}/${plugin_name}"
    fi

    if [[ -f "${plugins_folder}/${plugin_name}/${plugin_name}.plugin.zsh" ]]; then
        source "${plugins_folder}/${plugin_name}/${plugin_name}.plugin.zsh"
    fi

    if [[ "$plugin" == "romkatv/powerlevel10k" ]]; then
        source "${plugins_folder}/${plugin_name}/${plugin_name}.zsh-theme"
        source "$HOME"/.config/zsh/.p10k.sh
    fi
done

if [[ "$(date +%V)" -ne "$(/bin/cat "${plugins_folder}/last_refreshed")" ]]; then
    for plugin in "$plugins_folder"/*; do
        if [[ -d "$plugin" ]]; then
            git -C "$plugin" pull
        fi
    done

    date +%V > "${plugins_folder}/last_refreshed"
fi
