return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	init = function()
		vim.cmd.colorscheme("catppuccin")
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
			snacks = true,
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
		custom_highlights = function(colors)
			return {
				-- Slightly increase the luminosity of non-active lines
				-- vim.cmd([[highlight LineNr guifg=#606685]])
				SnacksPickerDir = { fg = colors.sapphire },
				WinSeparator = { fg = colors.overlay2 },
			}
		end,
	},
}
