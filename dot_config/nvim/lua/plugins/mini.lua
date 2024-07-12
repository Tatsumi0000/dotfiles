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
}
