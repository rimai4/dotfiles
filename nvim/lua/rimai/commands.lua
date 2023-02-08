local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
  group = yankGrp,
})

-- Format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

vim.cmd([[
  nmap <leader>t <Plug>(operator-sandwich-add)at
]])
