return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", config = mason },
		},
		config = function()
			local servers = {
				"dockerls",
				"eslint",
				"gopls",
				"kotlin_language_server",
				"lua_ls",
        "ruby_lsp",
				"rubocop",
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
