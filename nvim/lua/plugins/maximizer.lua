return {
	"0x00-ketsu/maximizer.nvim",
	config = true,
	keys = {
		{
			"<leader>z",
			function()
				require("maximizer").toggle()
			end,
		},
	},
}
