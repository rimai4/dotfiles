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
    lualine_x = { "diagnostics" },
    lualine_y = { "branch" },
    lualine_z = {},
  },
}
