require("lazy-setup")

-- set leader so plugin mappings are correct
vim.g.mapleader = " "

local plugin_table = require("rimai/plugin-table")
require("lazy").setup(plugin_table)

require("rimai/keymaps")
require("rimai/options")
require("rimai/colorscheme")
require("rimai/commands")
require("rimai/abbreviations")

-- plugins with more complex setup
require("rimai/plugins/telescope")
require("rimai/plugins/treesitter")
require("rimai/plugins/null-ls")
require("rimai/plugins/lsp")
