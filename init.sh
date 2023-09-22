#!/bin/bash
#
#To make symlinks to your Windows users, run this in Windows cmd/powershell and then restart. 
#
#setx WSLENV USERPROFILE/up
#
#This should make the windows user profile available as as ENV in wsl
#If you don't need any dotfiles to link from wsl to Windows (any line that uses $USERPROFILE) you can ignore this step

DOTFILES="$HOME/dotfiles"

echo "Creating symlinks..."

ln -s $DOTFILES/bash/.bashrc ~/
ln -s $DOTFILES/nvim ~/.config
ln -s $DOTFILES/tmux ~/.config
ln -s $DOTFILES/hushlogin/.hushlogin ~/
ln -s $DOTFILES/ideavim/.ideavimrc $USERPROFILE

