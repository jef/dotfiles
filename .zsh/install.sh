#!/bin/sh

_install_path="${HOME}/.dotfiles"
_backup_path="${HOME}/.dotfiles-backup"
git clone --bare git@github.com:jef/dotfiles.git "$_install_path"
config() {
   /usr/bin/git --git-dir="$_install_path" --work-tree="$HOME" "$@"
}
mkdir -p "$_backup_path"
if config checkout; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} "$_backup_path/{}"
fi;
config checkout
config config status.showUntrackedFiles no
