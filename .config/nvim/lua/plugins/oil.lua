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
			sort = {
				-- show last modified items on top
				{ "mtime", "desc" },
			},
		},
		columns = {
			"icon",
		},
		use_default_keymaps = false,
		keymaps = {
			["<BS>"] = { "actions.parent", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["g?"] = { "actions.show_help", mode = "n" },
		},
	},
	keys = {
		{ "<leader>-", "<Cmd>Oil<CR>" },
	},
}
