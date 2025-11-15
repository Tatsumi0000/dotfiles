return {
	{
		"MagicDuck/grug-far.nvim",
		config = function()
			require("grug-far").setup({})
			-- 普通に開く
			vim.keymap.set("n", "<leader>grf", ':lua require("grug-far").open({})<CR>')
			-- 今開いているファイルのパスを入力しつつ開く
			vim.keymap.set(
				"n",
				"<leader>grc",
				':lua require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })<CR>'
			)
			-- カーソル化の単語を入力しつつ開く
			vim.keymap.set(
				"n",
				"<leader>grw",
				':lua require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })<CR>'
			)
		end,
	},
}
