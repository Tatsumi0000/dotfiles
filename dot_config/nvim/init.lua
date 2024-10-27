require("base")
local theme = require("plugins.theme")
local mini = require("plugins.mini")
local fzf_lua = require("plugins.fzf")
local lsp_signature = require("plugins.lsp_signature")
local copy_file_path = require("plugins.copy-file-path")
local confirm = require"plugins.confirm"
local fern = require("plugins.fern")
local treesitter = require("plugins.treesitter")
local bufferline = require("plugins.bufferline")
local neotest = require("plugins.neotest")
local github_copilot = require("plugins.copilot")
local toggleterm = require("plugins.toggleterm")
local precognition = require("plugins.precognition")
local nvim_config_local = require("plugins.nvim-config-local")
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
  confirm,
	fern,
	treesitter,
	bufferline,
	neotest,
  github_copilot,
  toggleterm,
  precognition,
	nvim_config_local,
	{ "nvim-lua/plenary.nvim" },
	-- アイコンをつける
	{ "kyazdani42/nvim-web-devicons" },

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
	-- キーマップの入力途中でどのキーが何をするのか表示
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({})
		end,
	},
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
