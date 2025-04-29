return {
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
		},
		config = function()
			require("neoclip").setup()
			local set = vim.keymap.set
			set("n", "<leader>fy", "<cmd>Telescope neoclip<cr>", { desc = "Telescope find yank history" })
		end,
	},
}
