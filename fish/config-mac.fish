# environment variables
## LESS
[ -f /usr/local/bin/src-hilite-lesspipe.sh ]; and set -x LESSOPEN '| /usr/local/bin/src-hilite-lesspipe.sh %s '

# rbenv
if which plenv > /dev/null
    . (rbenv init -|psub) > /dev/null 2>&1
end

# nodebrew
[ -d "$HOME/.nodebrew" ]; and set -x PATH $PATH $HOME/.nodebrew/current/bin

# plenv
if which plenv > /dev/null
    . (plenv init -|psub) > /dev/null 2>&1
end

# pyenv
if which pyenv > /dev/null
    . (pyenv init -|psub) > /dev/null 2>&1
end

# golang
if which go > /dev/null
    [ ! -d "$HOME/.golang" ]; and mkdir -p "$HOME/.golang/bin"
    set -x GOPATH $HOME/.golang
    set -x PATH $PATH $GOPATH/bin
end

# sdkman
#[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; and source "$HOME/.sdkman/bin/sdkman-init.sh"

# git highlight
set -x PATH $PATH /usr/local/share/git-core/contrib/diff-highlight

# emacs
function es
    if pgrep -i emacs >/dev/null 2>&1
        echo "Emacs server is already running..."
    else
        which emacs; and emacs --daemon
    end
end
alias ek="emacsclient -e '(kill-emacs)' "
function e
    if not pgrep -i emacs >/dev/null 2>&1
        which emacs >/dev/null 2>&1; and emacs --daemon >/dev/null 2>&1
    else
        emacsclient -t $argv
    end
end
alias ec="open -a Emacs "

# Homebrew
alias bu='brew update; brew upgrade '
set -x HOMEBREW_NO_ANALYTICS 1

# Homebrew cask
set -x HOMEBREW_CASK_OPTS "--appdir=/Applications"

# zcat
alias zcat=gzcat

# "このアプリケーションで開く"をクリア
alias clearmenu="cd /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support; and ./lsregister -kill -r -domain system -domain local -domain user; and killall Finder; and cd"
