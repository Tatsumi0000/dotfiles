require("mason").setup({
	ui = {
		check_outdated_packages_on_open = false,
		border = "single",
	},
})
require("mason-lspconfig").setup_handlers({
	function(server)
		local opt = {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		}
		require("lspconfig")[server].setup(opt)
	end,
})

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
	},
	-- 横幅をMAXで20文字にする
	formatting = {
		format = function(entry, vim_item)
			vim_item.abbr = string.sub(vim_item.abbr, 1, 20)
			return vim_item
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-l>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	experimental = {
		ghost_text = true,
	},
})
-- 変数情報を表示
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
-- 定義ジャンプ
vim.keymap.set("n", "J", "<cmd>lua vim.lsp.buf.definition()<CR>")
-- 変数を使っている箇所を表示
vim.keymap.set("n", "V", "<cmd>lua vim.lsp.buf.references()<CR>")
-- 警告をホバーみたいに表示
vim.keymap.set("n", "e", "<cmd>lua vim.diagnostic.open_float()<CR>")
-- 括弧を自動補完
require("nvim-autopairs").setup({})

require('nvim-treesitter.configs').setup {
  -- Install the parsers for the languages you want to comment in
  -- Here are the supported languages:
  ensure_installed = {
    'astro', 'css', 'glimmer', 'graphql', 'html', 'javascript',
    'lua', 'nix', 'php', 'python', 'scss', 'svelte', 'tsx', 'twig',
    'typescript', 'vim', 'vue',
  },

  context_commentstring = {
    enable = true,
  },
}
