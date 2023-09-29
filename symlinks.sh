#!/bin/bash

ln -s $PWD/bash/.bashrc ~/
ln -s $PWD/bash/.bash_profile ~/
ln -s $PWD/nvim ~/.config
ln -s $PWD/tmux ~/.config
ln -s $PWD/ranger ~/.config

if [[ $(grep -i Microsoft /proc/version) ]]
then
    # WSL specific commands 
    :
else
    # Non-WSL commands
    ln -s $PWD/polybar ~/.config
    ln -s $PWD/i3 ~/.config
    ln -s $PWD/xinit/.xinitrc ~/
    ln -s $PWD/alacritty ~/.config
    ln -s $PWD/picom ~/.config
fi  
