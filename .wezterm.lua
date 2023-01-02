local wezterm = require("wezterm")

return {
	font_size = 20,
  window_decorations = "RESIZE",
  force_reverse_video_cursor = true,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Sonokai (Gogh)",
	font = wezterm.font("Liga SFMono Nerd Font"),
	keys = {
		{
			key = "w",
			mods = "CMD",
			action = wezterm.action.CloseCurrentPane({ confirm = true }),
		},
		{
			key = "Enter",
			mods = "CMD",
			action = wezterm.action.SplitHorizontal,
		},
		{
			key = "Enter",
			mods = "CMD|SHIFT",
			action = wezterm.action.SplitVertical,
		},
		{
			key = "LeftArrow",
			mods = "CMD",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "RightArrow",
			mods = "CMD",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "UpArrow",
			mods = "CMD",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = "CMD",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
	},
}
