require("lazy-setup")

-- set leader so plugin mappings are correct
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup("plugins")
require("options")
require("keymaps")
require("commands")
require("abbreviations")
