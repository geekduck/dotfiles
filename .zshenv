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
export RSYNC_RSH=ssh
export CVS_RSH=ssh

# EDITOR
export EDITOR='emacsclient -t'

# PAGER
export PAGER='less'
# export PAGER='lv -c -Au8'

# OS毎の設定
case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
      # rbenv
      if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

      # nodebrew
      [[ -d "$HOME/.nodebrew" ]] && export PATH="$HOME/.nodebrew/current/bin:$PATH"

      # plenv
      if which plenv > /dev/null; then eval "$(plenv init -)"; fi

      # pyenv
      if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

      # golang
      if which go > /dev/null; then
        [[ ! -d "$HOME/.golang" ]] && mkdir "$HOME/.golang"
        export GOPATH="$HOME/.golang"
        export PATH="$GOPATH/bin:$PATH"
      fi

      # less with source-highlight
      export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s '
      ;;
    # Linux
    linux*)
      # rbenv
      [[ -d "$HOME/.rbenv" ]] && export PATH="$HOME/.rbenv/bin:$PATH" && eval "$(rbenv init -)"

      # nodebrew
      [[ -d "$HOME/.nodebrew" ]] && export PATH="$HOME/.nodebrew/current/bin:$PATH"

      # plenv
      [[ -d "$HOME/.plenv" ]] && export PATH="$HOME/.plenv/bin:$PATH" && eval "$(plenv init -)"

      # pyenv
      [[ -d "$HOME/.pyenv" ]] && export PATH="$HOME/.pyenv/bin:$PATH" && eval "$(pyenv init -)"

      # golang
      if which go > /dev/null; then
        [[ ! -d "$HOME/.golang" ]] && mkdir "$HOME/.golang"
        export GOPATH="$HOME/.golang"
        export PATH="$GOPATH/bin:$PATH"
      fi

      # less with source-highlight
      [[ -d /usr/share/source-highlight/src-hilite-lesspipe.sh ]] && export LESSOPEN='| /usr/share/source-highlight/src-hilite-lesspipe.sh %s '
      ;;
esac
