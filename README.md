# dotfiles

## Getting started

- Install [Homebrew](http://brew.sh/) if macOS
- Install [yay](https://github.com/Jguer/yay) if Arch Linux
- Install [zsh](http://zsh.sourceforge.net/) via package manager
- Install [zgenom](https://github.com/jandamm/zgenom#installation)
- Install [chezmoi](https://www.chezmoi.io/docs/install/#one-line-package-install) via package manager
- Run `chezmoi init --apply jef`

You can then continue to get updates via `chezmoi update`

Have fun! :wave:

## Configuration

### SSH

```shell
chmod 700 ~/.ssh/
chmod 644 ~/.ssh/config ~/.ssh/known_hosts $public_key
chmod 600 $private_key
```

### GPG

```shell
# List keys
gpg --list-secret-keys
export key_name=NAME
# Backup existing key
gpg --export-secret-keys --armor "$key_name" > /path/to/secret-key-backup.asc
# Import keys
gpg —-import /path/to/secret-key-backup.asc
# Update trusts
gpg --edit-key "$key_name"
gpg> trust
gpg> save
```

## AUR

### Updating packages

1. Clone repo: `git clone ssh://aur@aur.archlinux.org/$repo.git`
1. Update `PKGBUILD`
    1. Edit the file `PKGBUILD` and make necessary changes, i.e. bumping the version number.
1. Update checksums in the PKGBUILD file.
    1. Use the tool `updpkgsums` for this. It can be installed by running `sudo pacman -Sy pacman-contrib`. It does the build, and writes the checksum into `PKGBUILD`.
1. Update `.SRCINFO` file.
    1. It is generated from `PKGBUILD`, and required for the AUR. Run `makepkg --printsrcinfo > .SRCINFO`
1. Verify before pushing.
    1. Run `makepkg -C -f --noconfirm`. If it is successful, your package is OK.
1. Push the changes.
