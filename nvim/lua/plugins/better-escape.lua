return {
	"max397574/better-escape.nvim",
	config = true,
	event = "VeryLazy",
	opts = {
		default_mappings = false,
		mappings = {
			i = {
				j = {
					k = "<Esc>",
				},
			},
			t = {
				j = {
					k = "<C-\\><C-n>",
				},
			},
		},
	},
}
