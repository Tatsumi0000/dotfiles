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
					require("neotest").setup({
						adapters = {
							require("neotest-rspec")({
								rspec_cmd = function()
									return vim.tbl_flatten({
										"docker",
										"compose",
										"exec",
										"backend",
										"bundle",
										"exec",
										"rspec",
									})
								end,

								transform_spec_path = function(path)
									local prefix = require("neotest-rspec").root(path)
									return string.sub(path, string.len(prefix) + 2, -1)
								end,

								results_path = "tmp/rspec.output",
							}),
						},
					}),
				},
			})
		end,
	},
}
