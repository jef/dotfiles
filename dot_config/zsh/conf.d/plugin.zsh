#!/bin/zsh

plugins=(
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
done

if type oh-my-posh &>/dev/null; then
    eval "$(oh-my-posh init zsh --config "$HOME"/.config/oh-my-posh/config.json)"
fi

last_refreshed_week="0"
if [[ -f "${plugins_folder}/last_refreshed" ]]; then
    last_refreshed_week="$(/bin/cat "${plugins_folder}/last_refreshed")"
fi

if [[ "$(date +%V)" -ne "$last_refreshed_week" ]]; then
    for plugin in "$plugins_folder"/*; do
        if [[ -d "$plugin" ]]; then
            git -C "$plugin" pull
        fi
    done

    date +%V > "${plugins_folder}/last_refreshed"
fi
