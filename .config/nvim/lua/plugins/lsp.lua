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
				-- Add custom server setup below
				local servers = {
					html = {
						filetypes = { "html", "templ" },
					},
				}

				-- Set up mason & configure language servers installed with mason
				require("mason-lspconfig").setup({
					automatic_installation = false,
					ensure_installed = {},
					handlers = {
						function(server_name)
							local server = servers[server_name] or {}
							server.capabilities = require("blink.cmp").get_lsp_capabilities(server.capabilities)
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
					{ path = "snacks.nvim", words = { "Snacks" } },
					{ path = "oil.nvim", words = { "oil" } },
				},
			},
		},
	},
	config = function()
		-- Add keybindings when lsp attaches to buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(event)
				local opts = { buffer = event.buf }
				-- diagnostics
				vim.keymap.set("n", "[e", function()
					vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR })
				end, opts)
				vim.keymap.set("n", "]e", function()
					vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR })
				end, opts)
				vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
				vim.keymap.set("n", "<Tab>", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

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
	end,
}
