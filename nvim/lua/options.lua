-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight current line
vim.o.cursorline = true

-- Tabs & indent
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Always keep 5 lines visible
vim.opt.scrolloff = 5

vim.opt.gdefault = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.autoread = true

vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.o.statuscolumn = "%s%=%{v:relnum?v:relnum:v:lnum} "

vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.splitbelow = true

-- lsp
vim.opt.updatetime = 300
vim.opt.backup = false
vim.opt.writebackup = false

-- save undo file
vim.o.undofile = true

-- Speed up loading ts_context_commentstring
vim.g.skip_ts_context_commentstring_module = true

-- Global status bar
vim.opt.laststatus = 3

-- Disable swap files
vim.opt.swapfile = false

-- Don't show intro message & message when opening file with lf
vim.opt.shortmess = {
	I = true,
}
