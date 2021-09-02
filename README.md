# dotfiles

## Getting started

- Install [zsh](http://zsh.sourceforge.net/)
- Install [Homebrew](http://brew.sh/) if macOS
- Install [zgenom](https://github.com/jandamm/zgenom#installation)
- Install [chezmoi](https://www.chezmoi.io/docs/install/#one-line-package-install)
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
