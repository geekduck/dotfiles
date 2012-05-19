#!/bin/bash

DOT_FILES=( .zshrc .zshrc.alias .zshenv .zlogin .gitconfig .gitignore .tmux.conf .dir_colors .emacs.d)

for file in ${DOT_FILES[@]}
do
    [ -s $HOME/$file ]  || ln -s `pwd`/$file $HOME/$file
done

# OS毎の設定
case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
    [ -s $HOME/.zshrc.osx ]  || ln -s `pwd`/.zshrc.osx $HOME/.zshrc.osx
    ;;
    # Linux
    linux*)
    [ -s $HOME/.zshrc.linux ]  || ln -s `pwd`/.zshrc.linux $HOME/.zshrc.linux
    ;;
esac
