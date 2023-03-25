local lsp = require("lsp-zero")
local cmp = require("cmp")
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

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

-- Example snippet
-- ls.add_snippets("javascript", {
-- 	s("cl", {
-- 		t("console.log("),
-- 		i(1),
-- 		t(")"),
-- 	}),
-- })

local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  select_behavior = "insert",
  preselect = cmp.PreselectMode.None,
  sources = {
    { name = "path" },
    { name = "nvim_lsp",               keyword_length = 1 },
    { name = "buffer",                 keyword_length = 2 },
    { name = "luasnip",                keyword_length = 2 },
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
  vim.keymap.set("n", "<Tab>", vim.lsp.buf.hover)
  vim.keymap.set("n", "?", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  -- set K navigate mapping
  vim.keymap.set("n", "K", "<C-u>zz", opts)

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
end)

lsp.setup()

vim.diagnostic.config({ signs = true })
