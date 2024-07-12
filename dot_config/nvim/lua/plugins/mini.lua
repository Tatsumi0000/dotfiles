return {
	-- nvimの起動画面をいい感じに
	{
		"echasnovski/mini.starter",
		version = false,
		config = function()
			require("mini.starter").setup()
		end,
	},
	-- インデントのスコープを表示
	{
		"echasnovski/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup()
		end,
	},
	-- カーソル下の単語をハイライト
	{
		"echasnovski/mini.cursorword",
		version = false,
		config = function()
			require("mini.cursorword").setup()
		end,
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup({
				mappings = {
					comment = "<Leader>/",
					comment_visual = "<Leader>/",
					comment_line = "<Leader>//",
				},
			})
		end,
	},
	{
		"echasnovski/mini.bufremove",
		version = false,
		config = function()
			require("mini.bufremove").setup()
			local set = vim.keymap.set
			set("n", "<C-w>", "<Cmd>bdelete<CR>")
		end,
	},
}
