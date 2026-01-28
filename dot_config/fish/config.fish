if status is-interactive
    # Commands to run in interactive sessions can go here
     eval (/opt/homebrew/bin/brew shellenv)
end

# nvimをvimで起動する
alias vim='nvim'
alias k='kubectl'
alias kz='kustomize'
alias dc='docker compose'

# Go言語の設定
set -x GOPATH $HOME/dev
set -x PATH $PATH $GOPATH/bin
# Androidの設定
set ANDROID $HOME/Library/Android 
set ANDROID_HOME $ANDROID/sdk
set -Ux PATH $ANDROID_HOME/tools $PATH
set -Ux PATH $ANDROID_HOME/tools/bin $PATH
set -Ux PATH $ANDROID_HOME/platform-tools $PATH 
set -Ux PATH $ANDROID_HOME/emulator $PATH

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

# git-wtの設定
if type -q git-wt
  git wt --init fish | source
end
# 候補から選んで cd する関数（名前をツールと変える）
function __git_wt_cd
    set -l target (command git-wt | fzf --header-lines=1 | awk '{print $1}')
    if test -n "$target"
        cd $target
        # cd した後に画面をリフレッシュする（fish用）
        commandline -f repaint
    end
end

# キーバインドの設定 (Ctrl+G)
bind \cg '__git_wt_cd'

