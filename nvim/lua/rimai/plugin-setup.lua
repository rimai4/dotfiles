return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- Colorschemes
	use("sainnhe/sonokai")
	use({ "ellisonleao/gruvbox.nvim" })

	use("jose-elias-alvarez/null-ls.nvim")
	use("maxmellon/vim-jsx-pretty")
	use("akinsho/toggleterm.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("machakann/vim-sandwich")
	use("windwp/nvim-ts-autotag")
	use("RRethy/nvim-treesitter-endwise")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	use({
		"jose-elias-alvarez/typescript.nvim",
		config = function()
			require("typescript").setup({})
		end,
	})

	use({
		"akinsho/git-conflict.nvim",
		tag = "*",
		config = function()
			require("git-conflict").setup()
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-file-browser.nvim")

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
	})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})
end)
