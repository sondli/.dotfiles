#!/bin/bash

DOTFILES="$HOME/dotfiles"

echo "Creating symlinks..."

ln -s $DOTFILES/nvim ~/.config
ln -s $DOTFILES/tmux ~/.config
ln -s $DOTFILES/ideavim ~/.config

echo "Symlinks created"
