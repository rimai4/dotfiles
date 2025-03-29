return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		format_on_save = function(bufnr)
			-- Disable with a global or buffer-local variable
			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end
			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			css = { "prettierd" },
			typescriptreact = { "prettierd" },
			scss = { "prettierd" },
			json = { "prettierd" },
			html = { "prettierd" },
			templ = { "templ" },
			go = { "gofmt", "goimports" },
			htmldjango = { "djlint" },
		},
	},
}
