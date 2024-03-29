local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "vendor",
      "bundle",
      ".git/.*",
      "yarn.lock",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
    },
  },
})

telescope.load_extension("fzf")

local set = vim.keymap.set

-- leader+pでファイル名検索
set("n", "<leader>ff", function()
  builtin.find_files({
    no_ignore = false,
    hidden = true,
    heme = "dropdown",
  })
end, {})

-- leader+gでプロジェクト内のファイルの文字列で検索
set("n", "<leader>fg", function()
  builtin.live_grep({
    no_ignore = false,
    hidden = true,
  })
end, {})
set('n', '<leader>fb', builtin.buffers)
set('n', '<leader>fh', builtin.help_tags)
