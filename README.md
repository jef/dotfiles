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

Setting up proper permissions for SSH keys.

```shell
chmod 700 ~/.ssh/
chmod 644 ~/.ssh/config ~/.ssh/known_hosts $public_key
chmod 600 $private_key
```

### GPG

This only really works if you don't mind losing any other keys (than your own).

```shell
# Export public and secret key and ownertrust

gpg -a --export your.email@domain.tld > somename-public-gpg.key
gpg -a --export-secret-keys your.email@domain.tld > somename-secret-gpg.key
gpg --export-ownertrust > somename-ownertrust-gpg.txt

# Import secret key (which contains the public key) and ownertrust

gpg --import somename-secret-gpg.key
gpg --import-ownertrust somename-ownertrust-gpg.txt
```

> Used from this [gist](https://gist.github.com/chrisroos/1205934).

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
