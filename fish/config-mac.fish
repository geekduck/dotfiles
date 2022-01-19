# environment variables

## Homebrew
if [ -d "/opt/homebrew/bin" ]
    eval (/opt/homebrew/bin/brew shellenv)
else
    eval (/usr/local/bin/brew shellenv)
end
set -x HOMEBREW_NO_ANALYTICS 1

## LESS
[ -f "$HOMEBREW_PREFIX"/bin/src-hilite-lesspipe.sh ]; and set -x LESSOPEN '| "$HOMEBREW_PREFIX"/bin/src-hilite-lesspipe.sh %s '

## rbenv
if which rbenv > /dev/null
    status --is-interactive; and source (rbenv init -|psub)
end

## volta
if which volta > /dev/null
    set -gx VOLTA_HOME "$HOME/.volta"
    set -gx PATH "$VOLTA_HOME/bin" $PATH
end

## plenv
if [ -d "$HOME/.plenv" ]
    set -x PATH $HOME/.plenv/bin $PATH
    status --is-interactive; and source (plenv init -|psub)
    # status --is-interactive; and source (pyenv virtualenv-init -|psub)
end

## pyenv
if which pyenv > /dev/null
    status --is-interactive; and eval (pyenv init --path)
end

## goenv
if [ -d "$HOME/.goenv" ]
    set -x PATH $HOME/.goenv/bin $PATH
    status --is-interactive; and source (goenv init -|psub)
end

## rust
if [ -d "$HOME/.cargo" ]
    set -x PATH $HOME/.cargo/bin $PATH
end

## sdkman
#[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; and source "$HOME/.sdkman/bin/sdkman-init.sh"

## git highlight
set -x PATH $PATH "$HOMEBREW_PREFIX"/share/git-core/contrib/diff-highlight

## emacs
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


# alias

## homebrew
alias bu='brew update; brew upgrade '

## zcat
alias zcat=gzcat

## "このアプリケーションで開く"をクリア
alias clearmenu="cd /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support; and ./lsregister -kill -r -domain system -domain local -domain user; and killall Finder; and cd"
