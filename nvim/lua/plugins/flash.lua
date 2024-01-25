return {
	"folke/flash.nvim",
	opts = {
		modes = {
			char = {
				enabled = false,
			},
			search = {
				enabled = false,
			},
		},
	},
	keys = {
		{
			"m",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"M",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash Treesitter",
		},
	},
}
