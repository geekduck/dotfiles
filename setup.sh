#!/bin/bash

DOT_FILES=( .zshrc .zshrc.alias .zshrc.env .zshrc.git .zshenv .zlogin .zshrc.completions .zshrc.antigen .gitconfig .tmux.conf .dir_colors .gemrc .git_templates .gitignore_global)

for file in ${DOT_FILES[@]}
do
    ( [ -s $HOME/$file ] || [ -d $HOME/$file ] )  || ln -s `pwd`/$file $HOME/$file
done

( [ -s $HOME/.zshrc.local ] || [ -d $HOME/.zshrc.local ] )  || cp `pwd`/.zshrc.local $HOME/.zshrc.local

# OS毎の設定
case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
    [ -s $HOME/.zshrc.osx ]  || ln -s `pwd`/.zshrc.osx $HOME/.zshrc.osx
    mkdir /usr/local/sbin
    [ -s $HOME/.config ] || mkdir -p $HOME/.config
    [ -s $HOME/.config/peco ] || ln -s `pwd`/.config/peco $HOME/.config/peco
    ;;
    # Linux
    linux*)
    [ -s $HOME/.zshrc.linux ]  || ln -s `pwd`/.zshrc.linux $HOME/.zshrc.linux
    [ -d $HOME/.config ] || mkdir -p $HOME/.config
    [ -d $HOME/.config/peco ] || ln -s `pwd`/.config/peco $HOME/.config/peco
    ;;
esac

# Emacs用リポジトリのクローン
git clone git@github.com:geekduck/emacs.d.git ~/.emacs.d

# antigen.zshのダウンロード
curl https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh

# imgcatのダウンロード
curl -sfL -o /usr/local/bin/imgcat https://raw.github.com/gnachman/iTerm2/master/tests/imgcat -O && chmod +x /usr/local/bin/imgcat

# gitのセットアップ
./setup-git.sh

# zsh reload
[ -s /bin/zsh ] || exec /bin/zsh -l
