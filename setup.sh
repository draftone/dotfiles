#!/bin/bash
DOT_FILES=(.zshrc .emacs.d .wsl)
for file in ${DOT_FILES[@]}
do
        ln -s $HOME/dotfiles/$file $HOME/$file
done
