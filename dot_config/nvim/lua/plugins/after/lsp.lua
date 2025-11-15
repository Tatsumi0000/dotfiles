---@type vim.lsp.Config

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- insertモード時にもエラーを更新
	update_in_insert = true,
})
-- vim.lsp.set_log_level("debug")

-- 変数情報を表示
-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
-- 変数を使っている箇所を表示
-- vim.keymap.set("n", "V", "<cmd>lua vim.lsp.buf.refe(rences()<CR>")
-- 警告をホバーみたいに表示
-- vim.keymap.set("n", "e", "<cmd>lua vim.diagnostic.open_float()<CR>")
-- 定義を新規バッファで表示
vim.keymap.set("n", "J", vim.lsp.buf.definition)
-- 変数情報を表示
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>")
--  カーソル下・カーソル行のError/Warningを表示
vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- コード内のError/Warningへジャンプ
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- 変数／関数の名前を一括変更
vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>")
-- 実行可能な修正の候補を表示
vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
-- rename
vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
-- コードを整形
-- vim.keymap.set("n", "gf", ":lua require(\"lint\").try_lint()<CR>")
-- 変数／関数の一覧を表示
vim.keymap.set("n", "V", "<cmd>Lspsaga finder<CR>")

-- Rubyでドットを入力するとインデントがおかしくなるので設定
vim.cmd("autocmd FileType ruby setlocal indentkeys-=.")
