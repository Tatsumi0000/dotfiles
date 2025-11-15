return {
	{
		"j-hui/fidget.nvim",
		opts = {},
		config = function()
			require("fidget").setup({
				progress = {
					display = {
						progress_icon = { pattern = "meter", period = 1 },
					},
				},
			})
		end,
	},
}
