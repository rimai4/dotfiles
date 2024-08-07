return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("catppuccin")

		-- Slightly increase the luminosity of non-active lines
		vim.cmd([[highlight LineNr guifg=#606685]])

		-- Update window separator
		vim.cmd([[highlight WinSeparator guifg=#b7bdf8]])
	end,
	opts = {
		flavour = "macchiato",
		no_italic = true,
		integrations = {
			cmp = true,
			diffview = true,
			flash = true,
			fzf = true,
			gitsigns = true,
			mason = true,
			neogit = true,
			neotree = true,
			telescope = true,
			treesitter = true,
			native_lsp = {
				enabled = true,
				underlines = {
					errors = { "undercurl" },
					hints = { "undercurl" },
					warnings = { "undercurl" },
					information = { "undercurl" },
				},
			},
		},
	},
}
