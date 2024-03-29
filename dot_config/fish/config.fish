if status is-interactive
    # Commands to run in interactive sessions can go here
     eval (/opt/homebrew/bin/brew shellenv)
end

# nvimをvimで起動する
alias vim='nvim'
alias k='kubectl'

# Go言語の設定
set -x GOPATH $HOME/dev
set -x PATH $PATH $GOPATH/bin
# nodebrewの設定
set -x PATH $HOME/.nodebrew/current/bin $PATH
# rbenvの設定
eval "$(rbenv init -)"

# インクリメンタルサーチ
set GHQ_SELECTOR peco

set -Ux FZF_DEFAULT_OPTS "--layout=reverse"

function ghq-fzf
    set root (ghq root)
    set repo (ghq list | fzf --preview="ls -AF --color=always $root/{1}")
    set dir "$root/$repo"
    if test -n "$dir"
        cd "$dir"
        commandline -f execute
    end
end
# ctrl+]でghqでcloneしたリポジトリを表示
bind \c] ghq-fzf

function fzf-switch-branch
    set -l branchname (
        env FZF_DEFAULT_COMMAND='git --no-pager branch -a | grep -v HEAD | sed -e "s/^.* //g"' \
            fzf --height 70% --prompt "BRANCH NAME> " \
                --preview "git --no-pager log -20 --color=always {}"
    )
    if test -n "$branchname"
        git switch (echo "$branchname"| sed "s#remotes/[^/]*/##")
        commandline -f execute
    end
end
# ctrl+bで最近のブランチを表示
bind \cb fzf-switch-branch

# cd後にlsで表示
function cd
builtin cd $argv[1]
ls -a
end

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH  $PYENV_ROOT/bin $PATH
pyenv init - | source

