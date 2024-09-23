# 2024 Dotfiles

## Managed
- git
- vim
- zsh
- custom scripts

### git
Git config file with primary branch renamed to main

### vim
Custom vimrc that install Plug when vim is opened

### zsh
> [!IMPORTANT]
> Running `setup_zsh` is required for zsh customizations in the .zshrc

Custom zshrc file with ohmyzsh and plugins

## custom scripts
Scripts I use to automate things that I want in $PATH

- `setup_zsh`: installs zsh and ohmyzsh with instructions to install plugins
- `fx`: makes a file execuatable

## Usage
This repo is designed to manage dotfiles with [GNU Stow per this article](https://tamerlan.dev/how-i-manage-my-dotfiles-using-gnu-stow/)

1. The .dotfiles directory is cloned to $HOME
2. `cd .dotfiles` and run `stow .`
3. Check $HOME to ensure symlinks look right
4. `stow -R .` can be used to delete and recreate links if things change


