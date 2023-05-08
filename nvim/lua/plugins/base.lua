return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		opts = {
			flavour = "macchiato",
			no_italic = true,
			integrations = {
				cmp = true,
				treesitter = true,
				telescope = true,
        gitsigns = true,
			},
		},
	},
	{
		"samjwill/nvim-unception",
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"machakann/vim-sandwich",
		keys = {
			{ "sa", mode = { "n", "v" } },
			{ "sr" },
			{ "sd" },
		},
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"jose-elias-alvarez/typescript.nvim",
		config = true,
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = true,
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"windwp/nvim-autopairs",
		config = true,
		event = "VeryLazy",
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
}
