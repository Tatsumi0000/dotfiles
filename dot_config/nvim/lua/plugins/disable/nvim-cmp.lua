return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/vim-vsnip",
			"onsails/lspkind.nvim" ,
		},
		config = function()
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
						mode = "text_symbol",
						maxwidth = 50,
						ellipsis_char = "...",
						before = function(entry, vim_item)
							vim_item.menu = ({
								buffer = "[Buffer]",
								nvim_lsp = "[LSP]",
								luasnip = "[LuaSnip]",
								nvim_lua = "[Lua]",
								latex_symbols = "[Latex]",
							})[entry.source.name]
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
		end,
	},
}
