return {

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

  -- 関数名などのスコープが見切れるときに上に固定する
	{ "nvim-treesitter/nvim-treesitter-context" },
	-- tree-sitterのインデントを良い感じに
	{ "yioneko/nvim-yati", version = "*", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "RRethy/nvim-treesitter-endwise" },
}
