local fterm = require("FTerm")

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
