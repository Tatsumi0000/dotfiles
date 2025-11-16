return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", config = mason },
		},
		config = function()
			local servers = {
				"eslint",
				"gopls",
				"lua_ls",
				"ruby_lsp",
				"rubocop",
				"solargraph",
        "kotlin_lsp"
			}
			local mason_lspconfig = require("mason-lspconfig")

			local mason = require("mason")
			mason.setup()
			mason_lspconfig.setup({
				automatic_enable = true,
				ensure_installed = servers,
			})
			vim.lsp.config("*", {})
			vim.lsp.enable(servers)
		end,
	},
}
