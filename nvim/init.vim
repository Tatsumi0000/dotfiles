" https://www.lisz-works.com/entry/vim-deinvim を参考
let s:dein_dir = expand('$HOME/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein.vimがない場合githubからDL
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
" 設定開始
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    " プラグインリスト(toml)
    let g:rc_dir    = expand('$HOME/.config/nvim/dein')
    let s:toml      = g:rc_dir . '/dein.toml'
    let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
    " tomlのロード
    call dein#load_toml(s:toml,      {'lazy': 0 })
    call dein#load_toml(s:lazy_toml, {'lazy': 1 })
    " 設定終了
    call dein#end()
    call dein#save_state()
endif
" Required:
filetype plugin indent on
syntax enable
" 未インストールがあればインストール
if dein#check_install()
    call dein#install()
endif

""" 全体設定
set number " 行数表示
set termguicolors " 24bitカラーを有効
"colorscheme NeoSolarized " カラースキーマを設定
colorscheme tokyonight-storm
set title " 編集中のファイル名表示
let g:airline#extensions#tabline#enabled = 1 " タブライン表示

""" Fern
" ctrl + n でファイルツリーを表示
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=30<CR>
let g:fern#default_hidden=1 " 隠しファイルを表示
" git差分を表示するまでの感覚を短く
set updatetime=250
" ファイルツリーにアイコンを表示
let g:fern#renderer = 'nerdfont'
" 文字コードを自動判別して開く
set encoding=utf-8
set fileencodings=iso-2022-jp,ucs-bom,sjis,utf-8,euc-jp,cp932,default,latin1
" modifableをONにする
set modifiable
set write
" クリップボードと連携
set clipboard+=unnamed
set cursorline " カーソルハイライト
set whichwrap=b,s,h,l,<,>,[,] " 左右のキーで行をまたぐ

" j,kを使ってPreviewを表示
function! s:fern_preview_init() abort
  nmap <buffer><expr>
        \ <Plug>(fern-my-preview-or-nop)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:edit)\<C-w>p",
        \   "",
        \ )
  nmap <buffer><expr> j
        \ fern#smart#drawer(
        \   "j\<Plug>(fern-my-preview-or-nop)",
        \   "j",
        \ )
  nmap <buffer><expr> k
        \ fern#smart#drawer(
        \   "k\<Plug>(fern-my-preview-or-nop)",
        \   "k",
        \ )
endfunction
augroup my-fern-preview
  autocmd! *
  autocmd FileType fern call s:fern_preview_init()
augroup END

" undoの永続化
if has('persistent_undo')
  let undo_path = expand('~/.config/nvim/undo')
  set undofile
endif

"vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')

" You need this otherwise you cannot switch modified buffer
set hidden

