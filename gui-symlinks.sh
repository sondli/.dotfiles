#!/bin/bash

DOTFILES="$HOME/.dotfiles"

echo "Creating gui apps symlinks..."

ln -s $DOTFILES/polybar ~/.config
ln -s $DOTFILES/i3 ~/.config
ln -s $DOTFILES/xinit/.xinitrc ~/
ln -s $DOTFILES/alacritty ~/.config

