return {
	"sindrets/diffview.nvim",
	keys = {
		{
			"<leader>d",
			"<cmd>DiffviewOpen<cr>",
		},
		{
			"<leader>D",
			"<cmd>DiffviewOpen origin/main<cr>",
		},
		{
			"<leader>fh",
			"<cmd>DiffviewFileHistory %<cr>",
		},
	},
	opts = {
		file_panel = {
			listing_style = "list",
		},
	},
}
