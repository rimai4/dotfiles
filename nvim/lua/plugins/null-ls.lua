return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		-- local diagnostics = null_ls.builtins.diagnostics

		return {
			sources = {
				formatting.prettierd,
				formatting.stylua,
				formatting.black,
				formatting.ruff,
				formatting.djlint,
				formatting.goimports,
				formatting.htmlbeautifier.with({
					extra_args = { "--keep-blank-lines", "1" },
				}),
			},
		}
	end,
}
