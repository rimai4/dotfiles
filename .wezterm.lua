local wezterm = require("wezterm")

return {
	font_size = 20,
  window_decorations = "RESIZE",
  force_reverse_video_cursor = true,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Sonokai (Gogh)",
	font = wezterm.font("Liga SFMono Nerd Font"),
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
	keys = {
    {
      key = 'RightArrow',
      mods = 'CMD',
      action = wezterm.action.SendKey {
        key = 'e',
        mods = 'CTRL',
      },
    },
    {
      key = 'LeftArrow',
      mods = 'CMD',
      action = wezterm.action.SendKey {
        key = 'a',
        mods = 'CTRL',
      },
    },
    {
      key = 'Backspace',
      mods = 'CMD',
      action = wezterm.action.SendKey {
        key = 'u',
        mods = 'CTRL',
      },
    },
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
			mods = "CMD|ALT",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "RightArrow",
			mods = "CMD|ALT",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "UpArrow",
			mods = "CMD|ALT",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = "CMD|ALT",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			key = "LeftArrow",
			mods = "CMD|ALT",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "RightArrow",
			mods = "CMD|ALT",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
		{
			key = "UpArrow",
			mods = "CMD|ALT",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "DownArrow",
			mods = "CMD|ALT",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
	},
}
