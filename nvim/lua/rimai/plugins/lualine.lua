local function cwd()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

return {
  options = { theme = "sonokai" },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "filename",
        path = 1,
      },
    },
    lualine_c = {},
    lualine_x = { "branch", "diagnostics" },
    lualine_y = { cwd },
    lualine_z = {},
  },
}
