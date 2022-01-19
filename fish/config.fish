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

## fuzzy finder
set -x FZF_DEFAULT_COMMAND "fd -t f"
set -x FZF_DEFAULT_OPTS "--color fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899 --height 40% --layout=reverse-list --border --ansi "
set -x FZF_CTRL_T_OPTS "--preview 'preview.sh {}'"
set -x FZF_ALT_C_OPTS "--preview 'ls -al {}'"

## ghq
set -x GHQ_SELECTOR fzf

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

# load theme config
[ -f ~/.config/fish/config-theme.fish ]; and . ~/.config/fish/config-theme.fish
