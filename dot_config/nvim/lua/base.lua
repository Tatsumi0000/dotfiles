local opt = vim.opt
-- 全体設定
opt.number = true -- 行数表示
opt.termguicolors = true -- 24bitカラーを有効
opt.title = true -- 編集中のファイル名表示
-- 文字コードを自動判別して開く
opt.encoding = "utf-8"
opt.fileencodings = "utf-8,iso-2022-jp,ucs-bom,sjis,euc-jp,cp932,default,latin1"
-- modifableをONにする
opt.modifiable = true
-- ファイルによってタブ幅を自動で変える
opt.smartindent = true
opt.shiftwidth = 0
opt.softtabstop = -1
opt.tabstop = 2
opt.expandtab = true
opt.write = true
-- クリップボードと連携
opt.clipboard = "unnamedplus"
opt.cursorline = true -- カーソルハイライト
opt.whichwrap = "b,s,h,l,<,>,[,]" -- 左右のキーで行をまたぐ
vim.g.termdebug_config = {
	winbar = 0,
}
-- 検索時に大文字小文字無視
vim.api.nvim_set_option("ignorecase", true)
-- 検索時に大文字が含まれていたらignorecaseを無効化
vim.api.nvim_set_option("smartcase", true)

local keymap_opts = { noremap = true, silent = true }
vim.keymap.set("n", "k", "gk", keymap_opts) -- 改行していてもキーで移動できる
vim.keymap.set("n", "j", "gj", keymap_opts)
vim.keymap.set("n", "<ESC><ESC>", ":nohlsearch<CR>", keymap_opts) -- ESC連打でハイライトを消す
vim.keymap.set("i", "<C-j>", "copilot#Next()", { expr = true, silent = true })
vim.keymap.set("i", "<C-k>", "copilot#Previous()", { expr = true, silent = true })
vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', { expr = true, silent = true, replace_keycodes = false })
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {}) -- タブを次へ
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {}) -- タブを前へ
vim.keymap.set("n", "n", "nzz") -- 検索時にハイライトを中央に表示(進む)
vim.keymap.set("n", "N", "Nzz") -- 検索時にハイライトを中央に表示(戻る)
vim.opt.swapfile = false -- swapファイルを作らない
-- undoの永続化
if vim.fn.has("persistent_undo") == 1 then
	opt.undodir = vim.fn.expand("~/.config/nvim/undo")
	opt.undofile = true
end
vim.keymap.set("i", "jj", "<Esc>:<C-u>w<CR>", { silent = true }) -- jjで保存

vim.g.mapleader = " " -- leaderキーをSpaceに割当
vim.keymap.set("n", "<leader>a", "ggVG", { noremap = true }) -- スペース+aで全選択
