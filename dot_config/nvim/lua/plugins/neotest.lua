return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"olimorris/neotest-rspec",
			"marilari88/neotest-vitest",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rspec"),
          require("neotest-vitest"),
				},
			})
		end,
	},
}
