return {
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
				formatting.goimports,
				formatting.htmlbeautifier.with({
					extra_args = { "--keep-blank-lines", "1" },
				}),
			},
		}
	end,
}
