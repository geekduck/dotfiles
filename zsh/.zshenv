#####################################################################
#
#  .zshenv file
#
#  initial setup file for both interactive and noninteractive zsh
#
#####################################################################

# cygwin以外ならcoredumpsizeを設定
[ $OSTYPE != "cygwin" ] && limit coredumpsize 0
# Setup command search path
typeset -U path
# (N-/) を付けることで存在しなければ無視してくれる
path=(
    {/usr/local,/usr,}/bin(N-/)
    {/usr/local,/usr,}/sbin(N-/)
    $path
)

## export
# 言語設定
export LANG=ja_JP.UTF-8

# リモートから起動するコマンド用の環境変数を設定(必要なら)
#export RSYNC_RSH=ssh
#export CVS_RSH=ssh

# EDITOR
export EDITOR='emacsclient -t'

# PAGER
export PAGER='less'
# export PAGER='lv -c -Au8'

# OS毎の設定
case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
      # less with source-highlight
      export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s '
      ;;
    # Linux
    linux*)
      # less with source-highlight
      [[ -d /usr/share/source-highlight/src-hilite-lesspipe.sh ]] && export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s '
      ;;
esac
