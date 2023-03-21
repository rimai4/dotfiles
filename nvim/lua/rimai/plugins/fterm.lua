local fterm = require("FTerm")

local gitui = fterm:new({
  ft = "fterm_gitui",
  cmd = "gitui",
  dimensions = {
    height = 0.95,
    width = 0.95,
  },
})

-- Use this to toggle gitui in a floating terminal
vim.keymap.set("n", "<A-g>", function()
  gitui:toggle()
end)
