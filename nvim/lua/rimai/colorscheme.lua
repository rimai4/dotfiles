vim.cmd([[let g:sonokai_style = 'atlantis']])
vim.cmd([[let g:sonokai_colors_override = {'bg0': ['#262e3c', '235'] }]])
vim.cmd([[let g:sonokai_better_performance = 1]])
vim.cmd([[let g:sonokai_disable_italic_comment = 1]])
vim.cmd([[colorscheme sonokai]])

-- Override highlight groups
vim.api.nvim_set_hl(0, "@field", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "@conditional", { link = "Identifier" })
