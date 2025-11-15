return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
		-- インデントを見やすく
vim.g.indent_guides_enable_on_vim_startup = true
-- lualineを設定
require("lualine").setup({
	options = {
		theme = "tokyonight",
	},
})
local function ignore_msg(kind, msg)
	return {
		filter = {
			event = "msg_show",
			kind = kind,
			find = msg,
		},
		opts = { skip = true },
	}
end
		end
	},

}

