local opt = vim.opt
-- 全体設定
vim.api.nvim_command("language en_US") -- nvim自体を英語環境にする
opt.number = true -- 行数表示
opt.termguicolors = true -- 24bitカラーを有効
opt.title = true -- 編集中のファイル名表示
-- 文字コードを自動判別して開く
opt.encoding = "utf-8"
opt.fileencodings = "utf-8,iso-2022-jp,ucs-bom,sjis,euc-jp,cp932,default,latin1"
-- modifableをONにする
opt.modifiable = true
opt.write = true
-- クリップボードと連携
opt.clipboard = "unnamedplus"
opt.cursorline = true -- カーソルハイライト
opt.whichwrap = "b,s,h,l,<,>,[,]" -- 左右のキーで行をまたぐ

local keymap_opts = { noremap = true, silent = true }
vim.keymap.set("n", "k", "gk", keymap_opts) -- 改行していてもキーで移動できる
vim.keymap.set("n", "j", "gj", keymap_opts)

vim.keymap.set("i", "<C-j>", "copilot#Next()", { expr = true, silent = true })
vim.keymap.set("i", "<C-k>", "copilot#Previous()", { expr = true, silent = true })
vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })

vim.keymap.set("n", "<leader>ft", ":Telescope find_files<CR>", { silent = true })
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>", { silent = true })

vim.opt.swapfile = false -- swapファイルを作らない
-- undoの永続化
if vim.fn.has("persistent_undo") == 1 then
	opt.undodir = vim.fn.expand("~/.config/nvim/undo")
	opt.undofile = true
end
vim.keymap.set("i", "jj", "<Esc>:<C-u>w<CR>", { silent = true }) -- jjで保存

vim.g.mapleader = " " -- leaderキーをSpaceに割当
vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true }) -- スペース+aで全選択

-- 自動でPakcerインストールをチェック
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- fern関連
	use({ "lambdalisue/fern.vim" })
	use({ "lambdalisue/fern-git-status.vim" })
	use({ "lambdalisue/nerdfont.vim" })
	use({ "lambdalisue/fern-renderer-nerdfont.vim" })
	-- あいまい検索
	use({ "nvim-lua/plenary.nvim" })
	-- アイコンをつける
	use({ "kyazdani42/nvim-web-devicons" })

	-- telescope関連
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	-- コメントアウト
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })

	-- キーマップの入力途中でどのキーが何をするのか表示
	-- telescope使用時に変な感じになるので一旦コメントアウト
	--use({
	--	"folke/which-key.nvim",
	--	config = function()
	--		vim.o.timeout = true
	--		vim.o.timeoutlen = 300
	--		require("which-key").setup({})
	--	end,
	--})
	-- color-scheme
	use({
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				vim.cmd([[colorscheme tokyonight]]),
				style = "storm",
			})
		end,
	})

	-- ステータスバーをいい感じに
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- ポップアップとかをいい感じに
	use({
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				-- add any options here
			})
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	})

	-- エディタにgitの差分や行単位の変更を表示
	use({ "lewis6991/gitsigns.nvim" })
	-- コードからGitHubに飛ぶ
	use({ "ruanyl/vim-gh-line" })

	-- 括弧を虹色
	use({ "luochen1990/rainbow" })
	-- インデントを見やすく
	use({ "nathanaelkane/vim-indent-guides" })
	-- 自動括弧補完
	use({ "windwp/nvim-autopairs" })

	-- lsp関連
	use({ "neovim/nvim-lspconfig" })
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/vim-vsnip" })
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use({ "onsails/lspkind.nvim" })
	use({ "tpope/vim-rails" })
	-- lspのUIをいい感じに
	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("lspsaga").setup({
				ui = {
					border = "rounded",
				},
				symbol_in_winbar = {
					enable = true,
				},
				lightbulb = {
					enable = true,
				},
				outline = {
					win_width = 50,
					layout = "float",
				},
			})
		end,
	})
	use({ "fgheng/winbar.nvim" })
	-- do/endとかのワードをハイライト
	use({
		"andymass/vim-matchup",
		setup = function()
			-- may set any options here
			vim.g.matchup_matchparen_offscreen = { method = "popup" }
		end,
	})
	-- buffersをタブみたいに表示する
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({})
		end,
	})
	-- キーマップの入力途中でどのキーが何をするのか表示
	use({
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({ "github/copilot.vim" })
	use({ "tpope/vim-endwise" })
	-- 保存時に整形するプラグイン
	use({ "dense-analysis/ale" })
	-- aleの設定
	vim.g.ale_fixers = {
		javascript = { "prettier" },
		vue = { "prettier" },
		lua = { "stylua" },
		ruby = { "rubocop" },
	}
	vim.g.ale_fix_on_save = 1
	vim.g.ale_javascript_prettier_use_local_config = 1
	vim.g.ale_ruby_rubocop_auto_correct_all = 1

	require("plugins/appearance")
	require("plugins/telescope")
	require("plugins/fern")
	require("plugins/lsp")
	require("plugins/gitsigns")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
