#!/bin/bash
#
#Run this in Windows to make the windows user profile available as as ENV in Linux
#setx WSLENV USERPROFILE/up

DOTFILES="$HOME/dotfiles"

echo "Creating symlinks..."

ln -s $DOTFILES/nvim ~/.config
ln -s $DOTFILES/tmux ~/.config
ln -s $DOTFILES/ideavim/.ideavimrc $USERPROFILE

