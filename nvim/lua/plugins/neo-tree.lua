return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = function()
		vim.cmd("let g:neo_tree_remove_legacy_commands = 1")

		return {
			close_if_last_window = false,
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
			},
		}
	end,
	keys = {
		{ "<A-b>", "<cmd>Neotree toggle right<CR>" },
	},
}
