return {
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
			vim.keymap.set("n", "<A-/>", vim.lsp.buf.code_action, opts)
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
}
