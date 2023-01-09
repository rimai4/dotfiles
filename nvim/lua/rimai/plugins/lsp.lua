local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  "tsserver",
  "sumneko_lua",
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
  ["<CR>"] = nil,
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  select_behavior = "insert",
  sources = {
    { name = "path" },
    { name = "nvim_lsp", keyword_length = 1 },
    { name = "buffer", keyword_length = 2 },
    { name = "luasnip", keyword_length = 2 },
  },
  completion = {
    completeopt = "menu,menuone,noselect"
  }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)

  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>i", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-h>", vim.lsp.buf.hover, opts)

  -- disable mappings
  vim.keymap.set("n", "K", "<C-u>zz", opts)

  vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end)

lsp.setup()

vim.diagnostic.config({
  signs = true,
})
