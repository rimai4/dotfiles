return {
	"numToStr/FTerm.nvim",
	opts = {
		border = "double",
		dimensions = {
			height = 0.9,
			width = 0.9,
		},
	},
	config = function(_, opts)
		local fterm = require("FTerm")
		fterm.setup(opts)

		-- Toggle floating terminal
		vim.keymap.set("n", "<A-i>", '<cmd>lua require("FTerm").toggle()<cr>')
		vim.keymap.set("t", "<A-i>", '<cmd>lua require("FTerm").toggle()<cr>')
	end,
	keys = { "<A-i>" },
}
