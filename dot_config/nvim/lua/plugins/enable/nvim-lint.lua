-- nvim-lintの設定
-- lintの実行結果をLSPに変換して教えてくれるやつ
return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			jsx = { "eslint" },
			tsx = { "eslint" },
			json = { "eslint" },
			ruby = { "rubocop" },
			sql = { "sqlfluff" },
			vue = { "eslint" },
			--go = { "golangcilint" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
