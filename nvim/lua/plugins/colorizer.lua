return {
	"norcalli/nvim-colorizer.lua",
	ft = {
		"css",
		"scss",
	},
	config = function()
		require("colorizer").setup({
			"css",
			"scss",
		})
	end,
}
