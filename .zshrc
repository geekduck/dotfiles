#####################################################################
#
#  .zshrc file
#  initial setup file for only interactive zsh
#  This file is read after .zshenv file is read.
#
#####################################################################

# Set shell options
# 有効にしてあるのは副作用の少ないもの
setopt auto_cd auto_remove_slash auto_name_dirs 
setopt auto_pushd prompt_subst
setopt extended_glob list_types no_beep always_last_prompt
setopt cdable_vars sh_word_split auto_param_keys pushd_ignore_dups
setopt nolistbeep
# 副作用強い
setopt auto_menu correct
# 便利だが副作用の強いものはコメントアウト
setopt rm_star_silent sun_keyboard_hack

# binding keys
bindkey -e

### 履歴
# 履歴設定
HISTFILE=~/.zhistory
HISTSIZE=600000
SAVEHIST=600000
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history
setopt inc_append_history
# 履歴検索設定
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^p'    history-beginning-search-backward
bindkey '^n'    history-beginning-search-forward

# antigen用の設定
[[ -s "$HOME/.zshrc.antigen" ]] && source "$HOME/.zshrc.antigen"

# 補完システムを利用: 補完の挙動が分かりやすくなる2つの設定のみ記述
zstyle ':completion:*' format '%BCompleting %d%b'
zstyle ':completion:*' group-name ''
autoload -U compinit && compinit

# git用の設定
[[ -s "$HOME/.zshrc.git" ]] && source "$HOME/.zshrc.git"

# alias設定ファイルを読み込む
[[ -s "$HOME/.zshrc.alias" ]] && source "$HOME/.zshrc.alias"

# 補完系設定ファイルを読み込む(基本はantigenで読み込んでいるzsh-completions)
[[ -s "$HOME/.zshrc.completions" ]] && source "$HOME/.zshrc.completions"

# cd後に自動でlsとgit statusを実行
chpwd() {
    show_ls_and_git_status
}

# OS毎の設定
case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
      # ここに設定
      [[ -s ~/.zshrc.osx ]] && source "$HOME/.zshrc.osx"

      # Shell起動時に自動で立ち上げておくもの
      es # Emacsデーモン
      ;;
    # Linux
    linux*)
      # ここに設定
      [[ -s ~/.zshrc.linux ]] && source "$HOME/.zshrc.linux"
      ;;
esac

# ローカル固有設定
[[ -s "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"
