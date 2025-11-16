return {
	{
		"github/copilot.vim",
		config = function()
			vim.keymap.set("i", "<C-j>", "copilot#Next()", { expr = true, silent = true })
			vim.keymap.set("i", "<C-k>", "copilot#Previous()", { expr = true, silent = true })
			vim.keymap.set(
				"i",
				"<C-l>",
				'copilot#Accept("<CR>")',
				{ expr = true, silent = true, replace_keycodes = false }
			)
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
		},
		keys = {
			{ "<leader>ghc", "<Cmd>CopilotChat<CR>", desc = "CopilotChat" },
		},
	},
}
