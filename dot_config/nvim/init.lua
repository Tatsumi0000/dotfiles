require("base")
local theme = require("plugins/theme")
local mini = require("plugins/mini")
local fzf_lua = require("plugins/fzf")
local lsp_signature = require("plugins/lsp_signature")
local copy_file_path = require("plugins/copy-file-path")
-- プラグインたちを追加
local plugins = {
	-- color-scheme
	theme,
	-- mini関連のプラグイン
	mini,
	-- fzf-lua関連のプラグイン
	fzf_lua,
  lsp_signature,
  copy_file_path,
	-- fern関連
	{ "lambdalisue/fern-git-status.vim" },
	{
		"lambdalisue/fern.vim",
		config = function()
			-- ctrl + n でfernを開く
			vim.keymap.set("n", "<C-n>", ":Fern . -reveal=% -drawer -toggle -width=30<CR>")
			vim.g["fern#default_hidden"] = true -- 隠しファイルを表示
		end,
		dependencies = {
			{ "lambdalisue/nerdfont.vim" },
			{
				"lambdalisue/fern-renderer-nerdfont.vim",
				config = function()
					-- アイコンフォントを使う
					vim.g["fern#renderer"] = "nerdfont"
				end,
			},
		},
	},
	{ "nvim-lua/plenary.nvim" },
	-- アイコンをつける
	{ "kyazdani42/nvim-web-devicons" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	-- ステータスバーをいい感じに
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},
	-- エディタにgitの差分や行単位の変更を表示
	{ "lewis6991/gitsigns.nvim" },

	-- 括弧を虹色
	{ "HiPhish/rainbow-delimiters.nvim" },
	-- 自動括弧補完
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },

	-- lsp関連
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-vsnip" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/vim-vsnip" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "onsails/lspkind.nvim" },
	{ "mfussenegger/nvim-lint" },
	{ "mhartington/formatter.nvim" },
	{
		"dense-analysis/ale",
		config = function()
			require("plugins/ale")
		end,
	},
	-- tree-sitterのインデントを良い感じに
	{ "yioneko/nvim-yati", version = "*", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "tpope/vim-rails" },
	-- lspのUIをいい感じに
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-lspconfig",
		},
		config = function()
			require("lspsaga").setup({
				ui = {
					border = "rounded",
				},
				symbol_in_winbar = {
					enable = true,
				},
				lightbulb = {
					enable = false,
				},
				outline = {
					win_width = 50,
					layout = "float",
				},
			})
		end,
	},
	{ "fgheng/winbar.nvim" },
	-- do/endとかのワードをハイライト
	{
		"andymass/vim-matchup",
		setup = function()
			-- may set any options here
			vim.g.matchup_matchparen_offscreen = { method = "ui" }
		end,
	},
	-- buffersをタブみたいに表示する
	{
		"akinsho/bufferline.nvim",
		-- version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					separator_style = "slant",
				},
				highlights = {
					separator = {
						guifg = "#15161E",
					},
					separator_visible = {
						guifg = "#15161E",
					},
					separator_selected = {
						guifg = "#15161E",
					},
				},
			})
		end,
	},

	-- キーマップの入力途中でどのキーが何をするのか表示
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
	{ "RRethy/nvim-treesitter-endwise" },
	{ "github/copilot.vim" },
	-- 検索したときにヒット数を表示
	{ "kevinhwang91/nvim-hlslens" },
	-- ファイルからGitHubを開く
	{ "almo7aya/openingh.nvim" },
}

-- lazyたちの設定
local lazy_opts = {
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				--'matchparen',
				--'netrwPlugin',
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, lazy_opts)
require("plugins/appearance")
require("plugins/lsp")
require("plugins/gitsigns")
