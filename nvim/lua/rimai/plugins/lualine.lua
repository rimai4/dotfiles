require("lualine").setup({
	options = { theme = 'sonokai' },
	sections = {
		lualine_a = { "mode" },
		lualine_b = {'%{&ft == "toggleterm" ? "".b:toggle_number."" : ""}'},
    lualine_c = {},
		lualine_x = {},
		lualine_y = { "branch", "diagnostics" },
		lualine_z = { "location" },
	},
})
