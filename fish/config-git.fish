# alias
alias g='git'
alias gc='git commit -v'
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias ga='git add'
alias gap='git add -p'
alias gm='git merge'
alias gf='git fetch'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gl='git log'
alias glg='git log --graph --date=short --decorate=short --pretty=format:"%Cgreen%h %Creset%cd %Cblue%cn %Cred%d %Creset%s"'
alias gs='git status -s -b'
alias gst='git status'
alias gn='git now -s'
alias gan='git add .; and git now -s'

## grep
function gp
    git grep -i --break $argv[1] -- $argv[2]
end

## find file and open in tig
function find-file-and-open-in-tig
    set -l filename (fd -t f | fzf --preview "bat --style=numbers --color=always {}")
    if test -n "$filename"
        tig "$filename"
    end
end
alias ft=find-file-and-open-in-tig

## grep file and open in tig
function grep-file-and-open-in-tig
    set -l filename (grep-preview 'git grep -i --color=always --line-number ')
    if test -n "$filename"
        tig "$filename"
    end
end
alias gt=grep-file-and-open-in-tig
