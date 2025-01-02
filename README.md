# My Dotfiles

## Install Brew Packages

```bash
xargs brew install < brewpackages.txt
```

## How to use stow

### Copy new directory (example)

```bash
cp -R ~/.config/tmux ~/dotfiles/.config/
```

### Debug Stow (verify)

```bash
stow --adopt --simulate -v .
```

### Stow them

```bash
stow --adopt .
```
