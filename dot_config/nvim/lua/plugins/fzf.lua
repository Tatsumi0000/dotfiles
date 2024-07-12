return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").setup({
				"fzf-native",
				actions = {
					files = {
						-- 検索結果のファイルに対してtab -> enterをしたら、そのファイルを一括で開く
						["default"] = require("fzf-lua.actions").file_edit,
					},
				},
				grep = {
					glob_flag = "--iglob",
					glob_separator = "%s%-%-",
					rg_opts = "--column --line-number --no-heading --color=always --smart-case -i",
				},
			})
			local set = vim.keymap.set
			set("n", "<leader>ff", require("fzf-lua").files, { desc = "Fzf Files" })
			set("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "Fzf live_grep" })
			set("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Fzf buffers" })
			set("n", "<leader>fif", require("fzf-lua").git_files, { desc = "Fzf Files gitignore" })
			set(
				"n",
				"<leader>fig",
				':lua require"fzf-lua".live_grep({ cmd = "git grep --line-number --column --color=always" })<CR>',
				{ desc = "Fzf git grep" }
			)
		end,
	},
}
