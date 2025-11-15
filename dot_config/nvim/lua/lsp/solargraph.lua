local lsp_config = require("lspconfig")

return {
	filetypes = { "ruby" },
	root_dir = lsp_config.util.rroot_pattern("Gemfile"),
	cmd = { os.getenv("HOME") .. "/.rbenv/shims/solargraph", "stdio" },
	settings = {
		solargraph = {
			diagnostics = true,
		},
	},
}
