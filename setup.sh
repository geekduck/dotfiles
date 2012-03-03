#!/bin/bash

DOT_FILES=( .zshrc .zshrc.alias .zshenv .zlogin .emacs.el .gitconfig .gitignore .inputrc .tmux.conf .dir_colors )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
