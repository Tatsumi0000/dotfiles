return {
	{
		"dense-analysis/ale",
		config = function()
			vim.g.ale_fixers = {
				javascript = { "prettier", "eslint" },
				vue = { "prettier", "eslint" },
				lua = { "stylua" },
				ruby = { "rubocop" },
				go = { "gofmt" },
				php = { "phpcbf" },
			}
			vim.g.ale_javascript_prettier_use_local_config = 1
			vim.g.ale_ruby_rubocop_auto_correct_all = 1
			vim.keymap.set("n", "<leader>gf", "<cmd>ALEFix<CR>")
		end,
	},
}
