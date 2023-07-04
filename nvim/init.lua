local opt = vim.opt
-- 全体設定
opt.number = true -- 行数表示
opt.termguicolors = true -- 24bitカラーを有効
opt.title = true -- 編集中のファイル名表示
-- 文字コードを自動判別して開く
opt.encoding = 'utf-8'
opt.fileencodings = 'utf-8,iso-2022-jp,ucs-bom,sjis,euc-jp,cp932,default,latin1'
-- modifableをONにする
opt.modifiable = true
opt.write = true
-- クリップボードと連携
opt.clipboard = "unnamedplus"
opt.cursorline = true -- カーソルハイライト
opt.whichwrap = 'b,s,h,l,<,>,[,]' -- 左右のキーで行をまたぐ
vim.opt.swapfile = false -- swapファイルを作らない
-- undoの永続化
if vim.fn.has('persistent_undo') == 1 then
  opt.undodir = vim.fn.expand('~/.config/nvim/undo')
  opt.undofile = true
end

opt.termguicolors = true
vim.g.mapleader = " " -- leaderキーをSpaceに割当
vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true } ) -- スペース+aで全選択

-- 自動でPakcerインストールをチェック
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  -- fern関連
  use { 'lambdalisue/fern.vim' }
  use { 'lambdalisue/fern-git-status.vim' }
  use { 'lambdalisue/nerdfont.vim' }
  use { 'lambdalisue/fern-renderer-nerdfont.vim' }
  -- あいまい検索
  use { 'nvim-lua/plenary.nvim' }
  -- アイコンをつける
  use { 'kyazdani42/nvim-web-devicons' }

  -- telescope関連
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  -- コメントアウト
  use {
    'numToStr/Comment.nvim',
    config = function()
	require('Comment').setup()
      end
   }

  -- color-scheme
  use { 'folke/tokyonight.nvim' }
  vim.cmd[[colorscheme tokyonight]]
  -- ステータスバーをいい感じに
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- エディタにgitの差分や行単位の変更を表示
  use { 'lewis6991/gitsigns.nvim' }
  -- コードからGitHubに飛ぶ
  use { 'ruanyl/vim-gh-line' }
  
  -- 括弧を虹色
  use { 'luochen1990/rainbow' }
  -- インデントを見やすく
  use { 'nathanaelkane/vim-indent-guides' }
  -- 自動括弧補完
  use { 'windwp/nvim-autopairs' }

  -- lsp関連
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-vsnip'}
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/vim-vsnip' }
  use { 'williamboman/mason.nvim' }
  use { 'williamboman/mason-lspconfig.nvim' }
  -- buffersをタブみたいに表示する
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons',
    config = function()
	require("bufferline").setup{}
    end
    }
  use { "github/copilot.vim" }
  use { 'tpope/vim-endwise' }
  -- 保存時に整形するプラグイン
  use { 'dense-analysis/ale' }
  -- aleの設定
  vim.g.ale_fixers = {
	  javascript = { 'prettier' },
	  vue = { 'prettier' },
  }
  vim.g.ale_fix_on_save = 1
  vim.g.ale_javascript_prettier_use_local_config = 1

  require 'plugins/appearance'
  require 'plugins/telescope'
  require 'plugins/fern'
  require 'plugins/lsp'
  require 'plugins/gitsigns'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
