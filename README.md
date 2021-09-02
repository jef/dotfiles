# dotfiles

## Getting started

- Install [zsh](http://zsh.sourceforge.net/)
- Install [Homebrew](http://brew.sh/) if macOS

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
