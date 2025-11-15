-- エディタにgitの差分や行単位の変更を表示
return {
	{
	"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
	signs = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged = {
		add = { text = "┃" },
		change = { text = "┃" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
		untracked = { text = "┆" },
	},
	signs_staged_enable = true,
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		follow_files = true,
	},
	auto_attach = true,
	attach_to_untracked = false,
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 500,
		ignore_whitespace = false,
		virt_text_priority = 100,
		use_focus = true,
	},
	current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000, -- Disable if file is longer than this (in lines)
	preview_config = {
		-- Options passed to nvim_open_win
		border = "single",
		style = "minimal",
		relative = "cursor",
		row = 0,
		col = 1,
	},
})

vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("v", "<leader>hs", ":Gitsigns stage_hunk<CR>")
vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("v", "<leader>hr", ":Gitsigns reset_hunk<CR>")
vim.keymap.set("n", "<leader>hS", ":Gitsigns stage_buffer<CR>")
vim.keymap.set("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>")
vim.keymap.set("n", "<leader>hR", ":Gitsigns reset_buffer<CR>")
vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
vim.keymap.set("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>hd", ":Gitsigns diffthis<CR>")
vim.keymap.set("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
vim.keymap.set("n", "<leader>td", ":Gitsigns toggle_deleted<CR>")
vim.keymap.set("n", "<leader>go", ":OpenInGHFileLines<CR>")
vim.keymap.set("v", "<leader>go", ":OpenInGHFileLines<CR>")

		end
	}
}