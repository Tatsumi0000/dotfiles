require('mason').setup()
-- 変数情報を表示
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
-- 定義ジャンプ
vim.keymap.set('n', 'J', '<cmd>lua vim.lsp.buf.definition()<CR>')
-- フォーマット
vim.keymap.set('n', 'F', '<cmd>lua vim.lsp.buf.formatting()<CR>')
-- 変数を使っている箇所を表示
vim.keymap.set('n', 'V', '<cmd>lua vim.lsp.buf.references()<CR>')
-- 括弧を自動補完
require("nvim-autopairs").setup {}