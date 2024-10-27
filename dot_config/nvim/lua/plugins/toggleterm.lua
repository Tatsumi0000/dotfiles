return {
	{
    -- terminalモードをいい感じにする
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
        open_mapping = [[<C-t>]],
      })
		end,
	},
}
