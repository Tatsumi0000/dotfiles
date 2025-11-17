return {
	-- buffersをタブみたいに表示する
	{
		"akinsho/bufferline.nvim",
		-- version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {}) -- タブを次へ
			vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {}) -- タブを前へ
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
