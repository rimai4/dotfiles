return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = true,
	keys = {
		{ "<leader>-", "<cmd>Oil<cr>" },
	},
	opts = {
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["<BS>"] = "actions.parent",
		},
	},
}
