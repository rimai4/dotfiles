return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		format_on_save = {
			timeout_ms = 3000,
			lsp_fallback = false,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
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
