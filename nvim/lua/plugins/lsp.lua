return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{
			-- Optional
			"williamboman/mason.nvim",
			build = function()
				vim.cmd([[ MasonUpdate ]])
			end,
		},
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

		-----------------------------------------------------------------
		-----------------------------------------------------------------
		-- Add keybindings when lsp attaches to buffer
		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			-- diagnostics
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "[e", function()
				vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, opts)
			vim.keymap.set("n", "]e", function()
				vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, opts)
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<Tab>", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			-- Prevent C-i from being overwritten (no idea where this happens as there is no call to lsp.default_keymaps)
			-- C-i is used to move forward in the jump list
			vim.keymap.set("n", "<C-i>", "<C-i>", opts)

			-- Format
			vim.keymap.set("n", "<leader>ff", function()
				require("conform").format()
			end, opts)

			-- Typescript commands
			if client.name == "vtsls" then
				vim.keymap.set("n", "<leader>rf", "<cmd>VtsExec rename_file<CR>", { desc = "[R]ename [F]ile" })

				-- Imports
				vim.keymap.set(
					"n",
					"<leader>ia",
					"<cmd>VtsExec add_missing_imports<CR>",
					{ desc = "[I]mports - [A]dd missing" }
				)
				vim.keymap.set(
					"n",
					"<leader>io",
					"<cmd>VtsExec organize_imports<CR>",
					{ desc = "[I]mports - [O]rganize" }
				)
			end

			-- Disable semantic highlighting
			-- client.server_capabilities.semanticTokensProvider = nil

			-- Disable virtual text
			vim.diagnostic.config({
				virtual_text = true,
			})
		end)

		-----------------------------------------------------------------
		-----------------------------------------------------------------
		-- Setup mason & configure language servers
		require("mason").setup({})
		require("mason-lspconfig").setup({
			handlers = {
				lsp.default_setup,
				lua_ls = function()
					local lua_opts = lsp.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
				emmet_language_server = function()
					require("lspconfig").emmet_language_server.setup({
						filetypes = { "htmldjango", "html", "templ" },
					})
				end,
			},
		})

		-----------------------------------------------------------------
		-----------------------------------------------------------------
		-- Configure nvim-cmp
		local cmp = require("cmp")
		local cmp_format = lsp.cmp_format()
		local luasnip = require("luasnip")
		local cmp_action = require("lsp-zero").cmp_action()

		-- Load snippets
		require("luasnip.loaders.from_vscode").lazy_load()
		-- Add extra rails snippets
		luasnip.filetype_extend("ruby", { "rails" })

		cmp.setup({
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
			},
			formatting = cmp_format,
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
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
		})
	end,
}
