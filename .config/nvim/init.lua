require("lazy-setup")

-- set leader so plugin mappings are correct
vim.g.mapleader = " "

require("lazy").setup("plugins")
require("options")
require("keymaps")
require("commands")
require("abbreviations")
