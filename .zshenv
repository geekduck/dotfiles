#####################################################################
#
#  Sample .zshenv file
#
#  initial setup file for both interactive and noninteractive zsh
#
#####################################################################

# cygwin以外ならcoredumpsizeを設定
[ $OSTYPE != "cygwin" ] && limit coredumpsize 0
# Setup command search path
typeset -U path
# (N-/) を付けることで存在しなければ無視してくれる
path=($path /usr/*/bin(N-/) /usr/local/*/bin(N-/) /var/*/bin(N-/))

## export
# 言語設定
export LANG=ja_JP.UTF-8

# リモートから起動するコマンド用の環境変数を設定(必要なら)
export RSYNC_RSH=ssh
export CVS_RSH=ssh

# less
export LESSCHARSET=utf-8
export LESS='-R'

# EDITOR
export EDITOR='emacs -nw'
