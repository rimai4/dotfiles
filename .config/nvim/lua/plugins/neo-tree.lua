return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = function()
		return {
			close_if_last_window = true,
			filesystem = {
				follow_current_file = {
					enabled = true,
				},
				use_libuv_file_watcher = true,
			},
		}
	end,
	keys = {
		{ "<leader>nt", "<cmd>Neotree toggle right<CR>" },
	},
}
