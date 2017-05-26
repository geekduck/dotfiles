# environment variables
## LESS
[ -f /usr/share/source-highlight/src-hilite-lesspipe.sh ] && set -x LESSOPEN '| /usr/share/source-highlight/src-hilite-lesspipe.sh %s '

# rbenv
if [ -d "$HOME/.rbenv" ]
    set -x PATH $PATH $HOME/.rbenv/bin
    rbenv init - | source
end

# nodebrew
[ -d "$HOME/.nodebrew" ]; and set -x PATH $PATH $HOME/.nodebrew/current/bin

# plenv
if [ -d "$HOME/.plenv" ]
    set -x PATH $PATH $HOME/.plenv/bin
    plenv init - | source
end

# pyenv
if [ -d "$HOME/.pyenv" ]
    set -x PATH $PATH $HOME/.pyenv/bin
    pyenv init - | source
end

# golang
if which go > /dev/null
    [ ! -d "$HOME/.golang" ]; and mkdir -p "$HOME/.golang/bin"
    set -x GOPATH $HOME/.golang
    set -x PATH $PATH $GOPATH/bin
end

# git highlight
set -x PATH $PATH /usr/share/doc/git/contrib/diff-highlight


# alias
alias open=xdg-open

# emacs
function es
    if pgrep emacs >/dev/null 2>&1
        echo "Emacs server is already running..."
    else
        which emacs; and emacs --daemon
    end
end
alias ek="emacsclient -e '(kill-emacs)' "
function e
    if ! pgrep emacs >/dev/null 2>&1
        which emacs >/dev/null 2>&1; and emacs --daemon >/dev/null 2>&1
    fi
        emacsclient -t @argv
    end
end
function ec
  emacsclient -c $argv[1] &
end
