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

## fuzzy add
function fuzzy-add
    set -l selected (
        env FZF_DEFAULT_COMMAND='git status -s' \
            fzf -m --no-sort --height 60% --preview '
                if test (echo {} | grep -E "^M" | wc -l) -eq 1 # staged
                    git diff --color --cached (echo {} | sed -e "s/^.* //g")
                else if test (echo {} | grep -E "^\?\?" | wc -l) -eq 0 # unstaged
                    git diff --color (echo {} | sed -e \'s/^.* //g\')
                else if test -d (echo {} | sed -e "s/^.* //g") # directory
                    ls -la (echo {} | sed -e \'s/^.* //g\')
                else
                    git diff --color --no-index /dev/null (echo {} | sed -e "s/^.* //g") # untracked
                end' | \
            awk -F ' ' '{print $NF}'
        )

    if test -n "$selected"
        git add $selected
    end
end

## fuzzy fixup
function fuzzy-fixup
    set -l commitId ( env FZF_DEFAULT_COMMAND='git log --oneline -n 30' \
        fzf --no-sort --height 70% --prompt "Search>" \
            --preview 'git show --color=always ( echo {} | cut -d " " -f 1 )' | cut -d " " -f 1 )

    if test -n "$commitId"
        git commit --no-verify --fixup "$commitId"
    end
end

## fuzzy find file and open in tig
function fuzzy-find-file-and-open-in-tig
    set -l filename (fd -t f | fzf --preview "bat --style=numbers --color=always {}")
    if test -n "$filename"
        tig "$filename"
    end
end
alias ft=fuzzy-find-file-and-open-in-tig

## fuzzy grep file and open in tig
function fuzzy-grep-file-and-open-in-tig
    set -l filename (grep-preview 'git grep -i --color=always --line-number ')
    if test -n "$filename"
        tig "$filename"
    end
end
alias gt=fuzzy-grep-file-and-open-in-tig

## fuzzy checkout branch
function fuzzy-checkout-branch
    set -l branchname (
        env FZF_DEFAULT_COMMAND='git --no-pager branch -a | grep -v HEAD | sed -e "s/^.* //g"' \
            fzf --height 70% --prompt "BRANCH NAME>" \
                --preview "git --no-pager log -20 --color=always {}"
    )
    git checkout (echo "$branchname"| sed "s#remotes/[^/]*/##")
end
