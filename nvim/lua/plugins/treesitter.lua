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
			enable_close_on_slash = false,
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
          ["if"] = "@function.inner",
					["af"] = "@function.outer",
          ["ic"] = "@class.inner",
					["ac"] = "@class.outer",
          ["ia"] = "@parameter.inner",
					["aa"] = "@parameter.outer",
					["iA"] = "@attribute.inner",
          ["aA"] = "@attribute.outer",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>]"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>["] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- set jumps in the jumplist
				goto_next_start = {
					["]a"] = "@parameter.inner",
					["]f"] = "@function.outer",
					["]c"] = "@class.outer",
				},
				goto_previous_start = {
					["[a"] = "@parameter.inner",
					["[f"] = "@function.outer",
					["[c"] = "@class.outer",
				},
			},
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
