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
    lualine_x = {},
    lualine_y = { "branch", "diagnostics" },
    lualine_z = { "location" },
  },
}
