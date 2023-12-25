-- ctrl + n でファイルツリーを表示
vim.keymap.set("n", "<C-n>", ":Fern . -reveal=% -drawer -toggle -width=30<CR>")
vim.g["fern#default_hidden"] = true -- 隠しファイルを表示

-- ファイルツリーにアイコンを表示
vim.g["fern#renderer"] = "nerdfont"
