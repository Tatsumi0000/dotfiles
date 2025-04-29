return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local set = vim.keymap.set
		set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find_files" })
		set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live_grep" })
		set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
		set("n", "<leader>fif", require("telescope.builtin").git_files, { desc = "Fzf Files" })
	end,
}
