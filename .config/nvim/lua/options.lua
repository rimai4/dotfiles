vim.opt.gdefault = true
vim.opt.updatetime = 300
vim.opt.autoread = true
vim.opt.termguicolors = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cmdwinheight = 20
vim.opt.cmdheight = 2

vim.opt.signcolumn = "yes"

-- Highlight current line
vim.o.cursorline = true

-- Tabs & indent
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Always keep 5 lines visible
vim.opt.scrolloff = 5

-- Don't wrap lines
vim.opt.wrap = false

-- Open horizontal split to the right & vertical split below
vim.opt.splitright = true
vim.opt.splitbelow = true

-- No backups
vim.opt.backup = false
vim.opt.writebackup = false

-- save undo file
vim.o.undofile = true

-- Global status bar
vim.opt.laststatus = 3

-- Disable swap files
vim.opt.swapfile = false

-- Don't show intro message
vim.opt.shortmess = {
	I = true,
}

-- Diagnostics
vim.diagnostic.config({
	jump = { float = true },
})
