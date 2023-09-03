-- 括弧を虹色有効
vim.g.rainbow_active = true
-- インデントを見やすく
vim.g.indent_guides_enable_on_vim_startup = true
-- lualineを設定
require("lualine").setup()
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

-- noiceを設定
-- ポップアップとかコマンドラインの見た目を変更
require("noice").setup({
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		progress = { enabled = false },
		signature = { enabled = false },
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = false,
		lsp_doc_border = false,
	},
	progress = {
		enabled = false,
	},
	hover = {
		enabled = false,
	},
	messages = { enabled = false },
	routes = {
		ignore_msg("", "render_symbol_winbar"),
		ignore_msg("lua_error", "CursorMoved"),
	},
})
