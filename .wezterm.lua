local wezterm = require("wezterm")

local config = {}

config.disable_default_key_bindings = false -- disable all default keybinds
config.font_size = 17
config.check_for_updates = false
config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true
config.hide_tab_bar_if_only_one_tab = false
config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("SFMono Nerd Font")

config.inactive_pane_hsb = {
	brightness = 0.9,
}

config.quick_select_patterns = {
	"\\d{5,}", -- numbers with at least 5 chars
}

config.leader = { key = "m", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	{
		key = "h",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "j",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "LEADER",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action.AdjustPaneSize({ "Right", 8 }),
	},
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action.AdjustPaneSize({ "Left", 8 }),
	},
	{
		key = "UpArrow",
		mods = "OPT",
		action = wezterm.action.AdjustPaneSize({ "Up", 3 }),
	},
	{
		key = "DownArrow",
		mods = "OPT",
		action = wezterm.action.AdjustPaneSize({ "Down", 3 }),
	},
	{ key = "c", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
	{ key = "y", mods = "LEADER", action = wezterm.action.QuickSelect },
	{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },
	{ key = "s", mods = "LEADER", action = wezterm.action.SplitVertical },
	{ key = "v", mods = "LEADER", action = wezterm.action.SplitHorizontal },
}

return config
