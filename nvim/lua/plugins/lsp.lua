require("mason").setup({
	ui = {
		check_outdated_packages_on_open = false,
		border = "single",
	},
})
local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
	function(server)
		local opt = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		}
		require("lspconfig")[server].setup(opt)
	end,
})
local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup({
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			ellipsis_char = "...",

			before = function(entry, vim_item)
				return vim_item
			end,
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-n>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	experimental = {
		ghost_text = true,
	},
})

-- 変数情報を表示
-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
-- 変数を使っている箇所を表示
-- vim.keymap.set("n", "V", "<cmd>lua vim.lsp.buf.references()<CR>")
-- 警告をホバーみたいに表示
-- vim.keymap.set("n", "e", "<cmd>lua vim.diagnostic.open_float()<CR>")
-- 括弧を自動補完
require("nvim-autopairs").setup({})
-- 定義ジャンプ
vim.keymap.set("n", "J", "<cmd>Lspsaga goto_definition<CR>")
-- 変数情報を表示
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>")
--  カーソル下・カーソル行のError/Warningを表示
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- コード内のError/Warningへジャンプ
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- 変数／関数の名前を一括変更
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>")
-- 実行可能な修正の候補を表示
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
-- 変数／関数の一覧を表示
vim.keymap.set("n", "V", "<cmd>Lspsaga finder<CR>")
-- ターミナルを開く/閉じる
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
vim.keymap.set("t", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
require("nvim-treesitter.configs").setup({
	-- Install the parsers for the languages you want to comment in
	-- Here are the supported languages:
	ensure_installed = {
		"astro",
		"bash",
		"c",
		"cpp",
		"css",
		"glimmer",
		"go",
		"graphql",
		"html",
		"javascript",
		"lua",
		"markdown",
		"markdown_inline",
		"nix",
		"php",
		"python",
		"regex",
		"ruby",
		"rust",
		"scss",
		"svelte",
		"tsx",
		"twig",
		"typescript",
		"vim",
		"vue",
	},

	context_commentstring = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
