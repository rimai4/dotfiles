return {
	{
		"sainnhe/sonokai",
		lazy = true,
		priority = 1000,
	},
	{
		"samjwill/nvim-unception",
		event = "VeryLazy",
	},
	{
		"kevinhwang91/nvim-hlslens",
		event = "VeryLazy",
		config = function()
			require("hlslens").setup({
				calm_down = true,
				nearest_only = true,
			})

			local kopts = { noremap = true, silent = true }

			vim.api.nvim_set_keymap(
				"n",
				"n",
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zz]],
				kopts
			)
			vim.api.nvim_set_keymap(
				"n",
				"N",
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zz]],
				kopts
			)
			vim.api.nvim_set_keymap("v", "*", [[*<Cmd>lua require('hlslens').start()<CR>N]], kopts)
			vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>N]], kopts)
			vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g*N", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		end,
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
	{
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
	},
	{
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
			require("rimai.plugins.fterm")
		end,
		keys = { "<A-i>", "<A-g>", "<A-n>" },
	},
	{ "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring({})
				end,
			},
		},
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			local function cwd()
				return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			end

			return {
				options = { theme = "sonokai" },
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{
							"filename",
							path = 1,
						},
					},
					lualine_c = {},
					lualine_x = { "branch", "diagnostics" },
					lualine_y = { cwd },
					lualine_z = {},
				},
			}
		end,
	},
	{
		"akinsho/bufferline.nvim",
		branch = "v3.0.0",
		opts = {
			options = {
				max_name_length = 15,
				tab_size = 15,
				show_buffer_icons = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
		event = "VeryLazy",
	},
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
		"monaqa/dial.nvim",
		config = function()
			vim.keymap.set("n", "+", require("dial.map").inc_normal(), { noremap = true })
			vim.keymap.set("n", "-", require("dial.map").dec_normal(), { noremap = true })

			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.constant.alias.bool,
					augend.constant.new({ elements = { "True", "False" } }),
				},
			})
		end,
		keys = { "+", "-" },
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "[S]earch [f]iles" } },
			{ "\\", "<cmd>Telescope find_files hidden=true<CR>", { desc = "[\\] - Search files" } },
			{ "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "[S]earch [b]uffers" } },
			{ "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "[S]earch by [w]ord" } },
			{ "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "[S]earch by [g]rep" } },
			{ "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "[S]earch [h]elp" } },
			{ "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "[S]earch [d]iagnostics" } },
			{ "<leader>sc", "<cmd>Telescope command_history<CR>", { desc = "[S]earch [c]ommand history" } },
			{ "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "[S]earch [s]ymbols" } },
			{
				"<leader>sS",
				"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
				{ desc = "[S]earch workspace [S]ymbols" },
			},
			{ "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "[S]earch [r]esume" } },
			{ "<leader>sR", "<cmd>Telescope lsp_references<CR>", { desc = "[S]earch workspace [R]eferences" } },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "[G]it [S]tatus" },
		},
		opts = function()
			local actions = require("telescope.actions")
			local layout = require("telescope.actions.layout")

			return {
				defaults = {
					file_ignore_patterns = { "yarn.lock", ".git" },
					prompt_prefix = "   ",
					selection_caret = "  ",
					layout_config = {
						horizontal = {
							prompt_position = "top",
						},
					},
					sorting_strategy = "ascending",
					mappings = {
						i = {
							["<C-t>"] = layout.toggle_preview,
							["<Esc>"] = actions.close,
						},
					},
				},
				pickers = {
					buffers = {
						show_all_buffers = true,
						sort_lastused = false,
						mappings = {
							i = {
								["<C-d>"] = "delete_buffer",
							},
						},
					},
				},
			}
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = function()
			vim.cmd("let g:neo_tree_remove_legacy_commands = 1")

			return {
				close_if_last_window = false,
				filesystem = {
					follow_current_file = true,
					use_libuv_file_watcher = true,
				},
			}
		end,
		keys = {
			{ "<A-b>", "<cmd>Neotree toggle right<CR>" },
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = function()
			local null_ls = require("null-ls")
			local formatting = null_ls.builtins.formatting

			return {
				sources = {
					formatting.prettierd,
					formatting.stylua,
					formatting.black,
					formatting.isort,
					require("typescript.extensions.null-ls.code-actions"),
				},
			}
		end,
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		event = "InsertEnter",
		dependencies = {
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
			{ "hrsh7th/cmp-nvim-lsp-signature-help" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			local lsp = require("lsp-zero")
			local cmp = require("cmp")

			lsp.preset("recommended")

			lsp.ensure_installed({
				"tsserver",
				"solargraph",
			})

			-- Fix undefined global 'vim'
			lsp.configure("sumneko_lua", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			local cmp_mappings = lsp.defaults.cmp_mappings({
				["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
			})

			lsp.setup_nvim_cmp({
				mapping = cmp_mappings,
				select_behavior = "insert",
				preselect = cmp.PreselectMode.None,
				sources = {
					{ name = "path" },
					{ name = "nvim_lsp", keyword_length = 1 },
					{ name = "buffer", keyword_length = 2 },
					{ name = "luasnip", keyword_length = 2 },
					{ name = "nvim_lsp_signature_help" },
				},
				completion = {
					completeopt = "menuone,noselect",
				},
			})

			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }

				-- diagnostics
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "<Tab>", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

				-- Map K and C-i so they are not overwritten
				vim.keymap.set("n", "K", "<C-u>zz", opts)
				vim.keymap.set("n", "<C-i>", "<C-i>", opts)

				-- typescript imports
				vim.keymap.set("n", "<leader>ir", function()
					require("typescript").actions.removeUnused()
				end, { desc = "[I]mports - [R]emove unused" })
				vim.keymap.set("n", "<leader>ia", function()
					require("typescript").actions.addMissingImports()
				end, { desc = "[I]mports - [A]dd missing" })
				vim.keymap.set("n", "<leader>io", function()
					require("typescript").actions.organizeImports()
				end, { desc = "[I]mports - [O]rganize" })

				vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

				-- Disable semantic highlighting
				client.server_capabilities.semanticTokensProvider = nil
			end)

			lsp.setup()
		end,
	},
}
