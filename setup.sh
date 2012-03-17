#!/bin/bash

DOT_FILES=( .zshrc .zshrc.alias .zshenv .zlogin .gitconfig .gitignore .inputrc .tmux.conf .dir_colors .emacs.d)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
