#!/bin/sh

_install_path="${HOME}/.dotfiles"
_backup_path="${HOME}/.dotfiles-backup"
git clone --bare git@github.com:jef/dotfiles.git "$_install_path"
config() {
   /usr/bin/git --git-dir="$_install_path" --work-tree="$HOME" "$@"
}
mkdir -p "$_backup_path"
if config checkout; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dotfiles.";
    config checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} "$_backup_path/{}"
fi;
config checkout
config config status.showUntrackedFiles no

echo "Installing zgenom."

git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"

echo "Installing asdf."

git clone https://github.com/asdf-vm/asdf.git ~/.asdf
if cd ~/.asdf; then
    git checkout "$(git describe --abbrev=0 --tags)"
fi
