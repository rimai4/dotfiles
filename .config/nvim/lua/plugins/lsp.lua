return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = true,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			config = function()
				-- Get default capabilities from cmp
				local capabilities = require("cmp_nvim_lsp").default_capabilities()

				-- Add custom server setup below
				local servers = {}

				-- Set up mason & configure language servers installed with mason
				require("mason-lspconfig").setup({
					handlers = {
						function(server_name)
							local server = servers[server_name] or {}

							server.capabilities =
								vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
							require("lspconfig")[server_name].setup(server)
						end,
					},
				})
			end,
		},
		{
			-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			"folke/lazydev.nvim",
			ft = "lua",
			opts = {
				library = {
					-- Load luvit types when the `vim.uv` word is found
					{ path = "luvit-meta/library", words = { "vim%.uv" } },
				},
			},
		},
		-- nvim-cmp & sources
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-nvim-lsp-signature-help" },
		{ "dcampos/cmp-snippy" },

		-- Snippets
		{ "dcampos/nvim-snippy" },
		{ "honza/vim-snippets" },
	},
	config = function()
		-- Add keybindings when lsp attaches to buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }
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

				vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, opts)

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.name == "vtsls" then
					-- Typescript import mappings
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
			end,
		})

		-- Set up snippets
		local snippy = require("snippy")
		snippy.setup({
			mappings = {
				is = {
					["<C-f>"] = "next",
					["<C-b>"] = "previous",
				},
			},
		})

		local cmp = require("cmp")
		cmp.setup({
			snippet = {
				expand = function(args)
					snippy.expand_snippet(args.body)
				end,
			},
			mapping = {
				["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
			},
			select_behavior = "insert",
			preselect = cmp.PreselectMode.None,
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp", keyword_length = 1 },
				{ name = "snippy", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "nvim_lsp_signature_help" },
			},
		})
	end,
}
