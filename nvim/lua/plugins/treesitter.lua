return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	dependencies = {
		"RRethy/nvim-treesitter-endwise",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = {
			"help",
			"html",
			"lua",
			"javascript",
			"typescript",
			"ruby",
			"tsx",
			"css",
			"scss",
			"json",
			"python",
			"markdown",
		},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		indent = {
			enable = true,
		},
		endwise = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		context_commentstring = {
			enable = true,
			enable_autocmd = false,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				scope_incremental = false,
				node_incremental = "<CR>",
				node_decremental = "<BS>",
			},
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]a"] = "@parameter.inner",
					["]f"] = "@function.outer",
				},
				goto_previous_start = {
					["[a"] = "@parameter.inner",
					["[f"] = "@function.outer",
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}