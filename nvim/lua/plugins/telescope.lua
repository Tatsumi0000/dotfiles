
local builtin = require('telescope.builtin')
local set = vim.keymap.set
-- Ctrl+pでファイル名検索
set('n', '<C-p>', builtin.find_files, {})
-- Ctrl+gでプロジェクト内のファイルの文字列で検索
set('n', '<C-g>', builtin.live_grep, {})