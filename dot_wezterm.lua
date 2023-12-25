local wezterm = require("wezterm")

local config = {}
local act = wezterm.action

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	-- カラースキーム
	color_scheme = "Tokyo Night Storm",
	font = wezterm.font_with_fallback({
		{ family = "Firple" },
		{ family = "Symbols Nerd Font Mono" },
	}),
	font_size = 24,
	window_decorations = "RESIZE",
	window_padding = { left = 2, right = 0, top = 0, bottom = 0 },
  audible_bell = "Disabled",
  -- タブバーの設定をコメントアウトしてる
	-- use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	-- wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	-- 	return {
	-- 		{ Text = " " .. tab.active_pane.title .. " " },
	-- 	}
	-- end),
	-- tab_and_split_indices_are_zero_based = true,
	default_prog = { "bash", "-c", "/opt/homebrew/bin/tmux a -t 0 || /opt/homebrew/bin/tmux" },
	keys = {
		{
			key = "LeftArrow",
			mods = "CTRL",
			action = act.SendKey({
				key = "b",
				mods = "META",
			}),
		},
		-- Ctrl+右矢印でカーソルを次の単語に移動
		{
			key = "RightArrow",
			mods = "CTRL",
			action = act.SendKey({
				key = "f",
				mods = "META",
			}),
		},
		-- Ctrl+Backspaceで前の単語を削除
		{
			key = "Backspace",
			mods = "CTRL",
			action = act.SendKey({
				key = "w",
				mods = "CTRL",
			}),
		},
	},
}
return config
