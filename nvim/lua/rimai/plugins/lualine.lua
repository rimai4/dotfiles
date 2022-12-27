local custom_gruvbox = require("lualine.themes.gruvbox")

require("lualine").setup({
	options = { theme = custom_gruvbox },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "filename" },
		lualine_c = {},
		lualine_x = {},
		lualine_y = { "branch", "diagnostics" },
		lualine_z = { "location" },
	},
})
