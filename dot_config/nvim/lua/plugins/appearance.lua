-- 括弧を虹色有効
local rainbow_delimiters = require("rainbow-delimiters")
vim.g.rainbow_delimiters = {
	strategy = {
		[""] = rainbow_delimiters.strategy["global"],
		vim = rainbow_delimiters.strategy["local"],
	},
	query = {
		[""] = "rainbow-delimiters",
		lua = "rainbow-blocks",
	},
	highlight = {
		"RainbowDelimiterRed",
		"RainbowDelimiterYellow",
		"RainbowDelimiterBlue",
		"RainbowDelimiterOrange",
		"RainbowDelimiterGreen",
		"RainbowDelimiterViolet",
		"RainbowDelimiterCyan",
	},
}
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
