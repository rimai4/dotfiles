return {
	"jiaoshijie/undotree",
	dependencies = "nvim-lua/plenary.nvim",
	keys = {
		{
			"<leader>su",
			function()
				require("undotree").toggle()
			end,
		},
	},
	opts = {
		float_diff = false,
	},
}
