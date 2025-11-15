-- lspのUIをいい感じに
return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
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
}
