return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		watch_for_changes = true,
		view_options = {
			show_hidden = true,
		},
		columns = {
			"icon",
		},
		keymaps = {
			["<BS>"] = { "actions.parent", mode = "n" },
			["~"] = {
				function()
					require("oil").open("~")
				end,
				mode = "n",
			},
		},
	},
	keys = {
		{ "<leader>-", "<Cmd>Oil --float<CR>" },
	},
}
