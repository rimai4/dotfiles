return {
	"akinsho/git-conflict.nvim",
	event = "VeryLazy",
	version = "*",
	opts = {
		default_mappings = {
			ours = "o",
			theirs = "t",
			none = "0",
			both = "b",
			prev = "[x",
			next = "]x",
		},
	},
}
