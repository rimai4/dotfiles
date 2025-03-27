local wezterm = require("wezterm")

local config = {}

config.disable_default_key_bindings = false -- disable all default keybinds
config.font_size = 17
config.check_for_updates = true
-- config.window_decorations = "RESIZE"
config.force_reverse_video_cursor = true
config.hide_tab_bar_if_only_one_tab = false
config.color_scheme = "Catppuccin Macchiato (Gogh)"
config.font = wezterm.font("SFMono Nerd Font", { weight = "Medium" })

config.max_fps = 120

config.inactive_pane_hsb = {
	brightness = 0.9,
}

config.quick_select_patterns = {
	"\\d{4,}", -- numbers with at least 4 chars
}

config.keys = {
	{ key = "y", mods = "CMD", action = wezterm.action.QuickSelect },
	{ key = "l", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "h", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "z", mods = "CMD", action = wezterm.action.TogglePaneZoomState },
	{
		key = "Enter",
		mods = "CMD",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "Enter",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "u",
		mods = "CMD",
		action = wezterm.action({
			QuickSelectArgs = {
				patterns = {
					"https?://\\S+",
				},
				action = wezterm.action_callback(function(window, pane)
					local url = window:get_selection_text_for_pane(pane)
					wezterm.open_with(url)
				end),
			},
		}),
	},
	-- {
	-- 	key = "T",
	-- 	mods = "CMD|SHIFT",
	-- 	action = wezterm.action.PromptInputLine({
	-- 		description = "Enter new name for tab",
	-- 		-- initial_value = "My Tab Name",
	-- 		action = wezterm.action_callback(function(window, pane, line)
	-- 			-- line will be `nil` if they hit escape without entering anything
	-- 			-- An empty string if they just hit enter
	-- 			-- Or the actual line of text they wrote
	-- 			if line then
	-- 				window:active_tab():set_title(line)
	-- 			end
	-- 		end),
	-- 	}),
	-- },
}

wezterm.on("format-tab-title", function(tab)
	local function tab_title(tab_info)
		local title = tab_info.tab_title
		-- if the tab title is explicitly set, take that
		if title and #title > 0 then
			return title
		end
		-- Otherwise, use the title from the active pane
		-- in that tab
		return tab_info.active_pane.title
	end

	local active_pane = tab.active_pane
	local pane_index = nil

	-- Find the index of the active pane within the tab
	for i, pane in ipairs(tab.panes) do
		if pane.pane_id == active_pane.pane_id then
			pane_index = i
			break
		end
	end

	local title = tab_title(tab)
	return title .. " - " .. (pane_index or "?")
end)

return config
