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

-- Use this to toggle gitui in a floating terminal
vim.keymap.set("t", "<A-g>", function()
  gitui:toggle()
end)
vim.keymap.set("n", "<A-g>", function()
  gitui:toggle()
end)
