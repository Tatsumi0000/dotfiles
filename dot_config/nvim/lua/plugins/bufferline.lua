return {
	-- buffersをタブみたいに表示する
	{
		"akinsho/bufferline.nvim",
		-- version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					separator_style = "slant",
				},
				highlights = {
					separator = {
						guifg = "#15161E",
					},
					separator_visible = {
						guifg = "#15161E",
					},
					separator_selected = {
						guifg = "#15161E",
					},
				},
			})
		end,
	},
}
