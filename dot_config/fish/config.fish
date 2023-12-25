

if status is-interactive
    # Commands to run in interactive sessions can go here
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

# ctrl+rで履歴を検索
function fish_user_key_bindings
  bind \cr 'peco_select_history (commandline -b)'
end

# インクリメンタルサーチ
set GHQ_SELECTOR peco

set -Ux FZF_DEFAULT_OPTS "--layout=reverse"

function ghq-fzf
  set src (ghq list | fzf --preview "ls -laTp (ghq root)/{} | tail -n+4 | awk '{print \$9\"/\"\$6\"/\"\$7 \" \" \$10}'")
  if test -n "$src"
    cd (ghq root)/$src  
    commandline -f execute
  end
end
# ctrl+]でghqでcloneしたリポジトリを表示
bind \c] ghq-fzf

# ctrl+bで最近のブランチを表示
bind \cb fzf_git_recent_branch

# cd後にlsで表示
function cd
builtin cd $argv[1]
ls -a
end

# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH  $PYENV_ROOT/bin $PATH
pyenv init - | source

