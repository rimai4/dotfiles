return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		lazygit = {
			enabled = true,
			configure = false,
		},
		quickfile = { enabled = true },
	},
	keys = {
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>fh",
			function()
				Snacks.lazygit.log_file()
			end,
			desc = "Lazygit",
		},
	},
}
