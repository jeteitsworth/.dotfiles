# 2024 Dotfiles

## Managed
- git
- vim
- i3
- doom emacs
- alacritty

### git
Git config file with primary branch renamed to main

### vim
Custom vimrc that installs Plug when vim is opened

### i3
i3 config that fixes the movement bindings to match vim

### doom emacs
All my settings and plugins for writing books in org mode

## Usage
This repo is designed to manage dotfiles with [GNU Stow per this article](https://tamerlan.dev/how-i-manage-my-dotfiles-using-gnu-stow/)

1. The .dotfiles directory is cloned to $HOME
2. `cd .dotfiles` and run `stow .`
3. Check $HOME to ensure symlinks look right
4. `stow -R .` can be used to delete and recreate links if things change


