#!/bin/bash

DOTFILES="$HOME/.dotfiles"

echo "Creating symlinks..."

ln -s $DOTFILES/nvim ~/.config
ln -s $DOTFILES/tmux ~/.config
ln -s $DOTFILES/polybar ~/.config
ln -s $DOTFILES/i3 ~/.config
ln -s $DOTFILES/xinit/.xinitrc ~/

