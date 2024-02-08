return {
	"gabrielpoca/replacer.nvim",
	keys = {
		{
			"<leader>rp",
			function()
				require("replacer").run()
			end,
		},
	},
}
