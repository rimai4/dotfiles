require("lazy-setup")

-- set leader so plugin mappings are correct
vim.g.mapleader = " "

if vim.g.vscode then
  require("lazy").setup("vscode-plugins")
  require("keymaps-vscode")
else
  require("lazy").setup("plugins")
  require("options")
  require("keymaps")
  require("commands")
  require("abbreviations")
end
