# environment variables
## lang
set -x LANG ja_JP.UTF-8

## EDITOR
set -x EDITOR 'emacsclient -t'

## PAGER
set -x PAGER less
# set -x PAGER 'lv -c -Au8'

## LESS
set -x LESS '-R -j10 --no-init --quit-if-one-screen'
set -x JLESSCHARSET japanese
set -x LESSCHARSET utf-8

## LS
set -x LSCOLORS ExFxCxDxBxegedabagacad

## ghq
set -x GHQ_SELECTOR sk
set -x GHQ_SELECTOR_OPTS '--layout=reverse-list --ansi -i'

# load config
switch (uname)
    case Linux
        [ -f ~/.config/fish/config-linux.fish ]; and . ~/.config/fish/config-linux.fish
    case Darwin
        [ -f ~/.config/fish/config-mac.fish ]; and . ~/.config/fish/config-mac.fish
end

# load local config
[ -f ~/.config.fish ]; and . ~/.config.fish

# load alias config
[ -f ~/.config/fish/alias.fish ]; and . ~/.config/fish/alias.fish
[ -f ~/.config/fish/config-git.fish ]; and . ~/.config/fish/config-git.fish

# key bindings
[ -f ~/.config/fish/config-keybindings.fish ]; and . ~/.config/fish/config-keybindings.fish

# load theme config
[ -f ~/.config/fish/config-theme.fish ]; and . ~/.config/fish/config-theme.fish
