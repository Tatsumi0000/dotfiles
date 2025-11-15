return {
	{
		"lambdalisue/fern.vim",
		config = function()
			-- ctrl + n でfernを開く
			vim.keymap.set("n", "<C-n>", ":Fern . -reveal=% -drawer -toggle -width=30<CR>")
			vim.g["fern#default_hidden"] = true -- 隠しファイルを表示
		end,
		dependencies = {
			{ "lambdalisue/nerdfont.vim" },
			{
				"lambdalisue/fern-renderer-nerdfont.vim",
				config = function()
					-- アイコンフォントを使う
					vim.g["fern#renderer"] = "nerdfont"
				end,
			},
		},
	},
	{ "lambdalisue/fern-git-status.vim" },
}
