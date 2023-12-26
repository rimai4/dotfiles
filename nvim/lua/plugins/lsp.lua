return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	event = "InsertEnter",
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
		-- Add lsp keybindings when lsp attaches to buffer
		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			-- diagnostics
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			vim.keymap.set("n", "<leader>d", vim.lsp.buf.type_definition, opts)
			vim.keymap.set("n", "<Tab>", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<A-/>", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			-- Prevent C-i from being overwritten (no idea where this happens as there is no call to lsp.default_keymaps)
			-- C-i is used to move forward in the jump list
			vim.keymap.set("n", "<C-i>", "<C-i>", opts)

			-- Add Format command when lsp is attached
			vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])

			-- Typescript imports
			if client.name == "vtsls" then
				vim.keymap.set(
					"n",
					"<leader>ir",
					"<cmd>VtsExec remove_unused_imports<CR>",
					{ desc = "[I]mports - [R]emove unused" }
				)
				vim.keymap.set(
					"n",
					"<leader>ia",
					"<cmd>VtsExec add_missing_imports<CR>",
					{ desc = "[I]mports - [A]dd missing" }
				)
				vim.keymap.set("n", "<leader>rf", "<cmd>VtsExec rename_file<CR>", { desc = "[R]ename [F]ile" })
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
						filetypes = { "htmldjango" },
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
		luasnip.filetype_extend("ruby", { "rails" })

		cmp.setup({
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
				["<Tab>"] = cmp_action.tab_complete(),
				["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
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
		})

		-- Autocomplete when searching with /
		-- cmp.setup.cmdline('/', {
		--   mapping = cmp.mapping.preset.cmdline(),
		--   sources = {
		--     { name = 'buffer' }
		--   }
		-- })
	end,
}
