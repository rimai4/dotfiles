local wezterm = require("wezterm")

local config = {}

config.disable_default_key_bindings = false -- disable all default keybinds
config.font_size = 17
config.check_for_updates = false
config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true
config.hide_tab_bar_if_only_one_tab = false
config.color_scheme = "Catppuccin Macchiato (Gogh)"
config.font = wezterm.font("SFMono Nerd Font")

config.max_fps = 75

config.inactive_pane_hsb = {
	brightness = 0.9,
}

config.quick_select_patterns = {
	"\\d{5,}", -- numbers with at least 5 chars
}

config.keys = {
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{ key = "s", mods = "CMD", action = wezterm.action.ActivateCopyMode },
	{ key = "y", mods = "CMD", action = wezterm.action.QuickSelect },
}

return config
