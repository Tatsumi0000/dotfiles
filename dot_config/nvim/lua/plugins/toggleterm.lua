return {
	{
		-- terminalモードをいい感じにする
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({})
			-- Alt-f でfloatでターミナルを開く
			vim.keymap.set("n", "<A-f>", "<cmd>ToggleTerm direction=float<CR>")
			vim.keymap.set("t", "<A-f>", "<cmd>ToggleTerm<CR>")
			-- Alt-d で水平でターミナルを開く
			vim.keymap.set("n", "<A-d>", "<cmd>ToggleTerm direction=horizontal<CR>")
			vim.keymap.set("t", "<A-d>", "<cmd>ToggleTerm<CR>")
		end,
	},
}
