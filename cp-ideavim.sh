#!/bin/bash
#
#setx WSLENV USERPROFILE/up
#
#This should make the windows user profile available as as ENV in wsl

echo "Copying .ideavimrc..."

cp $DOTFILES/ideavim/.ideavimrc $USERPROFILE/.ideavimrc
