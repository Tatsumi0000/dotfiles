local builtin = require("telescope.builtin")
local set = vim.keymap.set

-- leader+pでファイル名検索
set("n", "<leader>ff", function()
	builtin.find_files({
		file_ignore_patterns = { "node_modules", ".git", "vendor", "bundle" },
		no_ignore = false,
		hidden = true,
	})
end, {})

-- leader+gでプロジェクト内のファイルの文字列で検索
set('n', '<leader>gg', function()
    builtin.live_grep({
	    file_ignore_patterns = { "node_modules", ".git", "vendor", "bundle" },
	    no_ignore = false,
	    hidden = true,
    })
end, {})
