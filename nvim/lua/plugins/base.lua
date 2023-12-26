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
		"axelvc/template-string.nvim",
		opts = {
			remove_template_string = true,
		},
	},
	{
		"Everduin94/nvim-quick-switcher",
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
		config = function()
			vim.cmd([[ call operator#sandwich#set('all', 'all', 'highlight', 0) ]])
		end,
	},
	{
		"yioneko/nvim-vtsls",
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
