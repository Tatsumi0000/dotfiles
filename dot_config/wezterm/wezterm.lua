local wezterm = require("wezterm")
require("format")
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
	window_padding = {
		left = 2,
		right = 2,
		top = 0,
		bottom = 0,
	},
	use_fancy_tab_bar = false,
	tab_bar_at_bottom = false,
	hide_tab_bar_if_only_one_tab = true,
	font_size = 18,
	audible_bell = "Disabled",
	leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 },
	keys = {
		{ key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
		{ key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
		{ key = "v", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "s", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
		{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
		{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
		{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
		{ key = "H", mods = "LEADER", action = act.AdjustPaneSize({ "Left", 10 }) },
		{ key = "L", mods = "LEADER", action = act.AdjustPaneSize({ "Right", 10 }) },
		{ key = "K", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
		{ key = "J", mods = "LEADER", action = act.AdjustPaneSize({ "Down", 5 }) },
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
