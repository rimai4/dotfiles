require("lazy-setup")

-- set leader so plugin mappings are correct
vim.g.mapleader = " "

if vim.g.vscode then
  local plugin_table = require("rimai/plugin-table-vscode")
  require("lazy").setup(plugin_table)

  require("rimai/keymaps-vscode")
  require("rimai/plugins/treesitter-vscode")
else
  local plugin_table = require("rimai/plugin-table")
  require("lazy").setup(plugin_table)

  require("rimai/keymaps")
  require("rimai/options")
  require("rimai/colorscheme")
  require("rimai/commands")
  require("rimai/abbreviations")
end
