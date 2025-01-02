return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>-",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
	},
	opts = {
		open_for_directories = true,
		keymaps = {
			show_help = "§",
		},
	},
}