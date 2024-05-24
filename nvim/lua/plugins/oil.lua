return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = true,
	keys = {
		{ "<leader>fb", "<cmd>Oil<cr>" },
	},
	opts = {
		view_options = {
			show_hidden = true,
		},
	},
}
