#!/bin/bash

DOT_FILES=( .zshrc .zshrc.alias .zshrc.git .zshenv .zlogin .zshrc.completions .zshrc.antigen .gitconfig .tmux.conf .dir_colors .gemrc .git_templates)

for file in ${DOT_FILES[@]}
do
    ( [ -s $HOME/$file ] || [ -d $HOME/$file ] )  || ln -s `pwd`/$file $HOME/$file
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

# Emacs用リポジトリのクローン
git clone git@github.com:def-my/emacs.d.git ~/.emacs.d

# antigen.zshのダウンロード
curl https://raw.github.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh

# SHELL reload
exec $SHELL -l
