
#!/bin/bash

DOTFILES="$HOME/.dotfiles"

echo "Creating terminal apps symlinks..."

ln -s $DOTFILES/bash/.bashrc ~/
ln -s $DOTFILES/bash/.bash_profile ~/
ln -s $DOTFILES/nvim ~/.config
ln -s $DOTFILES/tmux ~/.config

