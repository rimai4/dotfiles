return {
	"stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_fix", "ruff_format" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			json = { "prettierd" },
			html = { "prettierd" },
			go = { "gofmt", "goimports" },
			htmldjango = { "djlint" },
		},
	},
}
