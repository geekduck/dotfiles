#!/bin/bash

DOT_FILES=( .gitconfig .tmux.conf .dir_colors .gemrc .git_templates .gitignore_global .tigrc )

for file in ${DOT_FILES[@]}
do
    ( [ -s $HOME/$file ] || [ -d $HOME/$file ] )  || ln -s `pwd`/$file $HOME/$file
done

case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
    [ ! -d $HOME/.config ] && mkdir -p $HOME/.config
    [ ! -d $HOME/.config/peco ] && ln -s `pwd`/.config/peco $HOME/.config/peco
    [ -d $HOME/.config/fish ] && mv $HOME/.config/fish $HOME/.config/fish_back
    [ ! -d $HOME/.config/fish ] && ln -snf `pwd`/fish $HOME/.config/fish

    # imgcatのダウンロード
    curl -sfL -o /usr/local/bin/imgcat https://iterm2.com/utilities/imgcat -O && chmod +x /usr/local/bin/imgcat
    ;;
    # Linux
    linux*)
    [ ! -d $HOME/.config ] && mkdir -p $HOME/.config
    [ ! -d $HOME/.config/peco ] && ln -s `pwd`/.config/peco $HOME/.config/peco
    [ -d $HOME/.config/fish ] && mv $HOME/.config/fish $HOME/.config/fish_back
    [ ! -d $HOME/.config/fish ] && ln -snf `pwd`/fish $HOME/.config/fish
    ;;
esac

# fisherman
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# gitのセットアップ
./setup-git.sh

# fish reload
[ -s /usr/local/bin/fish ] && exec /usr/local/bin/fish -l
[ -s /usr/bin/fish ] && exec /usr/bin/fish -l
