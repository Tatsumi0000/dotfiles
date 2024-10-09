require("mason").setup({
	ui = {
		check_outdated_packages_on_open = false,
		border = "single",
	},
})
local lsp_config = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
mason_lspconfig.setup()
mason_lspconfig.setup_handlers({
	function(server_name)
		local server_config = { capabilities = capabilities }
		if server_name == "tsserver" then
			server_config.init_options = {
				plugins = {
					{
						name = "@vue/typescript-plugin",
						location = "/opt/homebrew/lib/node_modules/@vue/typescript-plugin",
						languages = { "javascript", "typescript", "vue" },
					},
				},
			}
			server_config.filetypes = {
				"javascript",
				"typescript",
				"vue",
			}
			server_config.root_dir = lsp_config.util.root_pattern("package.json")
		end
		server_config.on_attach = on_attach
		lsp_config[server_name].setup(server_config)
		-- https://github.com/apple/sourcekit-lsp/blob/main/Editors/README.md#neovim-08-and-above
		lsp_config.sourcekit.setup({
			cmd = { "sourcekit-lsp" },
			filetypes = { "swift" },
			-- プロジェクトのルートを.gitで判断
			-- root_dir = function(fname)
			-- 	return lsp_config.util.find_git_ancestor(fname)
			-- end,
		})
	end,
})
-- vim.lsp.set_log_level("debug")

local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup({
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	sources = {
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
		{ name = "path" },
		{ name = "buffer" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "text_symbol",
			maxwidth = 50,
			ellipsis_char = "...",
			before = function(entry, vim_item)
				vim_item.menu = ({
					buffer = "[Buffer]",
					nvim_lsp = "[LSP]",
					luasnip = "[LuaSnip]",
					nvim_lua = "[Lua]",
					latex_symbols = "[Latex]",
				})[entry.source.name]
				return vim_item
			end,
		}),
	},
	mapping = cmp.mapping.preset.insert({
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-n>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	experimental = {
		ghost_text = true,
	},
})
-- formatterの設定
-- local formatter = require("formatter")
-- formatter.setup({
-- 	filetype = {
-- 		javascript = {
-- 			require("formatter.filetypes.javascript").prettier,
-- 		},
-- 		javascriptreact = {
-- 			require("formatter.filetypes.javascriptreact").prettier,
-- 		},
-- 		typescript = {
-- 			require("formatter.filetypes.typescript").prettier,
-- 		},
-- 		typescriptreact = {
-- 			require("formatter.filetypes.typescriptreact").prettier,
-- 		},
-- 		vue = {
-- 			require("formatter.filetypes.vue").prettier,
-- 		},
-- 		css = {
-- 			require("formatter.defaults").prettier,
-- 		},
-- 		lua = {
-- 			require("formatter.filetypes.lua").stylua,
-- 		},
-- 		-- 上記以外
-- 		["*"] = {
-- 			require("formatter.filetypes.any").remove_trailing_whitespace,
-- 			-- https://github.com/mhartington/formatter.nvim/issues/260#issuecomment-1676039290
-- 			function()
-- 				local defined_types = require("formatter.config").values.filetype
-- 				if defined_types[vim.bo.filetype] ~= nil then
-- 					return nil
-- 				end
-- 				vim.lsp.buf.format({ async = true })
-- 			end,
-- 		},
-- 	},
-- })

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
-- ターミナルを開く/閉じる
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
vim.keymap.set("t", "<A-d>", "<cmd>Lspsaga term_toggle<CR>")
-- 括弧を自動補完
require("nvim-autopairs").setup({})
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
		"javascript",
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
-- Rubyでドットを入力するとインデントがおかしくなるので設定
vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
-- nvim-lintの設定
-- lintの実行結果をLSPに変換して教えてくれるやつ
require("lint").linters_by_ft = {
	javascriptreact = { "eslint" },
	typescriptreact = { "eslint" },
	jsx = { "eslint" },
	tsx = { "eslint" },
	json = { "eslint" },
	ruby = { "rubocop" },
	sql = { "sqlfluff" },
	vue = { "eslint" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
-- vim-railsの設定
-- 現在のvim-railsはrequestsのspecを良い感じに開いてくれないので、自分で設定する
-- https://flowfx.de/blog/teach-vim-rails-about-request-specs/
vim.cmd([[
  let g:rails_projections = {
      \ "app/controllers/*_controller.rb": {
      \   "test": [
      \     "spec/controllers/{}_controller_spec.rb",
      \     "spec/requests/{}_spec.rb"
      \   ],
      \ },
      \ "spec/requests/*_spec.rb": {
      \   "alternate": [
      \     "app/controllers/{}_controller.rb",
      \   ],
      \ },
      \ "app/services/*_service.rb": {
      \   "test": [
      \     "spec/services/{}_service_spec.rb",
      \     "spec/services/{}_spec.rb"
      \   ],
      \ },
      \ "spec/services/*_spec.rb": {
      \   "alternate": [
      \     "app/services/{}_service.rb",
      \   ],
      \ }}
  ]])
