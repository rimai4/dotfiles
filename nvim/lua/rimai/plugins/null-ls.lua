local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.prettierd,
    formatting.stylua,
    formatting.black,
    require("typescript.extensions.null-ls.code-actions"),
  },
})
