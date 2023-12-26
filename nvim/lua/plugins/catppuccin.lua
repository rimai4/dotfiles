return {
	"catppuccin/nvim",
	name = "catppuccin",
	init = function()
		vim.cmd.colorscheme("catppuccin")
		-- Slightly increase the luminosity of non-active lines
		vim.cmd([[highlight LineNr guifg=#606685]])
	end,
	opts = {
		flavour = "macchiato",
		no_italic = true,
		integrations = {
			cmp = true,
			treesitter = true,
			telescope = true,
			gitsigns = true,
			mason = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
			neotree = true,
		},
	},
}
