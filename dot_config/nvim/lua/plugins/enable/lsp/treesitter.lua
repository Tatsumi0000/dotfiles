return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			-- 括弧を自動補完
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"astro",
		"bash",
		"c",
		"cpp",
		"css",
		"glimmer",
		"go",
		"graphql",
		"html",
    "java",
		"javascript",
    "kotlin",
		"lua",
		"markdown",
		"markdown_inline",
		"nix",
		"php",
		"python",
		"regex",
		"ruby",
		"rust",
		"scss",
		"swift",
		"svelte",
		"tsx",
		"twig",
		"typescript",
		"vim",
		"vue",
    "xml",
	},
	endwise = {
		enable = true,
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	matchup = {
		enable = true,
	},
})
		end
	},
  -- 関数名などのスコープが見切れるときに上に固定する
	{ "nvim-treesitter/nvim-treesitter-context" },
	-- tree-sitterのインデントを良い感じに
	{ "yioneko/nvim-yati", version = "*", dependencies = "nvim-treesitter/nvim-treesitter" },
	{ "RRethy/nvim-treesitter-endwise" },
}
