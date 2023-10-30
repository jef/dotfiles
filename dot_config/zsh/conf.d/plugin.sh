#!/bin/bash

plugins=(
    romkatv/powerlevel10k
    Aloxaf/fzf-tab
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-history-substring-search
    zsh-users/zsh-syntax-highlighting
)

plugins_folder="${HOME}/.local/share/zsh/plugins"
mkdir -p "$plugins_folder"

for plugin in "${plugins[@]}"; do
    plugin_name="${plugin##*/}"

    if [[ $plugin == "Aloxaf/fzf-tab" ]]; then
        if ! type fzf &>/dev/null; then
            continue
        fi
    fi

    if [[ ! -d "${plugins_folder}/${plugin_name}" ]]; then
        git clone "https://github.com/${plugin}.git" "${plugins_folder}/${plugin_name}"
    fi

    if [[ -f "${plugins_folder}/${plugin_name}/${plugin_name}.plugin.zsh" ]]; then
        if [[ $plugin == "Aloxaf/fzf-tab" ]]; then
            autoload -Uz compinit && compinit
        fi

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
