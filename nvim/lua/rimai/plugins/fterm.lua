local fterm = require("FTerm")

local gitui = fterm:new({
  ft = "fterm_gitui",
  cmd = "gitui",
  border = "double",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

-- Toggle gitui terminal
vim.keymap.set("t", "<A-g>", function()
  gitui:toggle()
end)
vim.keymap.set("n", "<A-g>", function()
  gitui:toggle()
end)

-- Toggle floating terminal
vim.keymap.set("n", "<A-i>", '<cmd>lua require("FTerm").toggle()<cr>')
vim.keymap.set("t", "<A-i>", '<cmd>lua require("FTerm").toggle()<cr>')

-- Toggle lf terminal
vim.keymap.set("n", "<A-n>", function()
  local buf = vim.api.nvim_buf_get_name(0)
  lf = fterm:new({
    ft = "fterm_lf",
    cmd = { "lf", buf },
    border = "double",
    dimensions = {
      height = 0.9,
      width = 0.9,
    },
  })
  lf:toggle()
end)

vim.api.nvim_create_autocmd("User", {
  pattern = "UnceptionEditRequestReceived",
  callback = function()
    lf:close(true)
  end,
})
