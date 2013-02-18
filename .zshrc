#####################################################################
#
#  .zshrc file
#  initial setup file for only interactive zsh
#  This file is read after .zshenv file is read.
#
#####################################################################

###
# Set Shell variable
# WORDCHARS=$WORDCHARS:s,/,,

## Default shell configuration
#
# set prompt
# colors enables us to idenfity color by $fg[red].
autoload colors
colors
case ${UID} in
    0)
        PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
        PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
        SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
        [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
          PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
        ;;
    *)
        #
        # Color
        #
        DEFAULT=$'%{\e[1;0m%}'
        RESET="%{${reset_color}%}"
        #GREEN=$'%{\e[1;32m%}'
        GREEN="%{${fg[green]}%}"
        #BLUE=$'%{\e[1;35m%}'
        BLUE="%{${fg[blue]}%}"
        RED="%{${fg[red]}%}"
        CYAN="%{${fg[cyan]}%}"
        WHITE="%{${fg[white]}%}"
        #
        # Prompt
        #
        setopt prompt_subst
        #PROMPT='${fg[white]}%(5~,%-2~/.../%2~,%~)% ${RED} $ ${RESET}'
        PROMPT='${RESET}${GREEN}${WINDOW:+"[$WINDOW]"}${RESET}%{$fg_bold[cyan]%}${USER}@%m${RESET}${WHITE}$ ${RESET}'
        RPROMPT='${RESET}${WHITE}[${CYAN}%(5~,%-2~/.../%2~,%~)% ${WHITE}]${WINDOW:+"[$WINDOW]"} ${RESET}'

        # 直前のコマンドの終了ステータスが0以外のときは赤くする。
        # ${MY_MY_PROMPT_COLOR}はprecmdで変化させている数値。
        local MY_COLOR="$ESCX"'%(0?.${MY_PROMPT_COLOR}.31)'m
        local NORMAL_COLOR="$ESCX"m

        # Show git branch when you are in git repository
        # http://d.hatena.ne.jp/mollifier/20100906/p1
        autoload -Uz add-zsh-hook
        autoload -Uz vcs_info

        zstyle ':vcs_info:*' enable git svn hg bzr
        zstyle ':vcs_info:*' formats '(%s)-[%b]'
        zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
        zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
        zstyle ':vcs_info:bzr:*' use-simple true

        autoload -Uz is-at-least
        if is-at-least 4.3.10; then
        # この check-for-changes が今回の設定するところ
            zstyle ':vcs_info:git:*' check-for-changes true
            zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
            zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当の文字列に変更する
            zstyle ':vcs_info:git:*' formats '(%s)-[%b%c%u]'
            zstyle ':vcs_info:git:*' actionformats '(%s)-[%b%c%u|%a]'
        fi

        function _update_vcs_info_msg() {
            psvar=()
            LANG=en_US.UTF-8 vcs_info
            psvar[2]=$(_git_not_pushed)
            [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
        }
        add-zsh-hook precmd _update_vcs_info_msg

        function _git_not_pushed()
        {
            if [ "$(git rev-parse --is-inside-work-tree 2>/dev/null)" = "true" ]; then
                head="$(git rev-parse HEAD)"
                for x in $(git rev-parse --remotes)
                do
                    if [ "$head" = "$x" ]; then
                        return 0
                    fi
                done
                echo "{?}"
            fi
            return 0
        }

        RPROMPT="%1(v|%F${CYAN}%1v%2v%f|)${vcs_info_git_pushed}${RESET}${WHITE}[${CYAN}%(5~,%-2~/.../%2~,%~)% ${WHITE}]${WINDOW:+"[$WINDOW]"} ${RESET}"
        ;;
esac

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

# perlbrew
[[ -s "$HOME/.perlbrew/etc/bashrc" ]] && source "$HOME/.perlbrew/etc/bashrc"

# pythonz
[[ -s "$HOME/.pythonz/etc/bashrc" ]] && source "$HOME/.pythonz/etc/bashrc" && export "PATH=$HOME/.pythonz/pythons/default/bin:$PATH"

# alias設定ファイルを読み込む
[[ -s "$HOME/.zshrc.alias" ]] && source "$HOME/.zshrc.alias"

# 補完系設定ファイルを読み込む(基本はantigenで読み込んでいるzsh-completions)
[[ -s "$HOME/.zshrc.completions" ]] && source "$HOME/.zshrc.completions"

# OS毎の設定
case "${OSTYPE}" in
    # Mac(Unix)
    darwin*)
      # ここに設定
      [[ -s ~/.zshrc.osx ]] && source "$HOME/.zshrc.osx"
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
