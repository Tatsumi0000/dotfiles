-- このファイルの存在するディレクトリ
local dirname = vim.fn.stdpath('config') .. '/lua/lsp'

-- 設定したlspを保存する配列
local lsp_names = {}

-- 同一ディレクトリのファイルをループ
for file, ftype in vim.fs.dir(dirname) do
  -- `.lua`で終わるファイルを処理（init.luaは除く）
  if ftype == 'file' and vim.endswith(file, '.lua') and file ~= 'init.lua' then
    -- 拡張子を除いてlsp名を作る
    local lsp_name = file:sub(1, -5) -- fname without '.lua'
    -- 読み込む
    local ok, result = pcall(require, 'lsp.' .. lsp_name)
    if ok then
      -- 読み込めた場合はlspを設定
      vim.lsp.config(lsp_name, result)
      table.insert(lsp_names, lsp_name)
    else
      -- 読み込めなかった場合はエラーを表示
      vim.notify('Error loading LSP: ' .. lsp_name .. '\n' .. result, vim.log.levels.WARN)
    end
  end
end

-- 読み込めたlspを有効化
vim.lsp.enable(lsp_names)
