return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = true,
	keys = {
		{ "<leader>-", "<cmd>Oil<cr>" },
	},
	opts = {
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<BS>"] = "actions.parent",
		},
	},
}
