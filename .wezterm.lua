local wezterm = require("wezterm")

return {
  font_size = 16,
  check_for_updates = false,
  window_decorations = "RESIZE",
  force_reverse_video_cursor = true,
  hide_tab_bar_if_only_one_tab = true,
  color_scheme = "Sonokai (Gogh)",
  font = wezterm.font("SFMono Nerd Font"),
  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
  },
  quick_select_patterns = {
    '"[^"]+"',
  },
  keys = {
    { key = "x", mods = "CMD", action = wezterm.action.ActivateCopyMode },
    { key = "s", mods = "CMD", action = wezterm.action.QuickSelect },
    { key = "r", mods = "CMD", action = wezterm.action.RotatePanes("Clockwise") },
    {
      key = "z",
      mods = "CMD",
      action = wezterm.action.TogglePaneZoomState,
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
      key = "w",
      mods = "CMD",
      action = wezterm.action.CloseCurrentPane({ confirm = true }),
    },
    {
      key = "Backspace",
      mods = "CMD",
      action = wezterm.action.SendKey({
        key = "u",
        mods = "CTRL",
      }),
    },
    {
      key = "RightArrow",
      mods = "CMD",
      action = wezterm.action.SendKey({
        key = "e",
        mods = "CTRL",
      }),
    },
    {
      key = "LeftArrow",
      mods = "CMD",
      action = wezterm.action.SendKey({
        key = "a",
        mods = "CTRL",
      }),
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
      key = "RightArrow",
      mods = "SHIFT",
      action = wezterm.action.AdjustPaneSize({ "Right", 8 }),
    },
    {
      key = "LeftArrow",
      mods = "SHIFT",
      action = wezterm.action.AdjustPaneSize({ "Left", 8 }),
    },
    {
      key = "UpArrow",
      mods = "SHIFT",
      action = wezterm.action.AdjustPaneSize({ "Up", 3 }),
    },
    {
      key = "DownArrow",
      mods = "SHIFT",
      action = wezterm.action.AdjustPaneSize({ "Down", 3 }),
    },
  },
}
