local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Swap ; and :
map("n", ";", ":")
map("n", ":", ";")
map("v", ";", ":")
map("v", ":", ";")

-- Go to start and end of line with H and L
map("n", "H", "^")
map("n", "L", "$")
map("v", "H", "^")
map("v", "L", "$")
map("s", "H", "H")
map("s", "L", "L")

-- Don't put single char deletes in register
map("n", "x", '"_x')

-- Map jk and <C-]> to Escape
map("i", "jk", "<Esc>")
map("i", "<C-]>", "<Esc>")

-- Page up/down & center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "K", "<C-u>zz")
map("n", "J", "<C-d>zz")
map("v", "K", "<C-u>zz")
map("v", "J", "<C-d>zz")

-- Delete word in insert mode
map("i", "<A-BS>", "<C-w>")

-- Move lines
map("n", "<A-Down>", ":m .+1<CR>==")
map("n", "<A-Up>", ":m .-2<CR>==")
map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
map("v", "<A-Up>", ":m '<-2<CR>gv=gv")

-- Yank to clipboard
map("v", "y", '"+y')
map("n", "y", '"+y')
map("n", "Y", '"+yg_')
map("n", "yy", '"+yy')

-- Format
map("n", "<leader>f", "<cmd>Format<CR>", { desc = "[F]ormat file" })

-- Clear search results with escape
map("n", "<Esc>", "<cmd>noh<CR><Esc>")

-- Move between buffers with <C-h> and <C-l>
map("n", "<A-,>", "<cmd>bp<CR>")
map("n", "<A-.>", "<cmd>bn<CR>")

-- Close buffer/close all except current buffer
map("n", "<leader>w", "<cmd>bd<CR>")
map("n", "<leader>W", "<cmd>%bd!|e#|bd#<CR>")

-- Don't replace register after pasting
map("v", "p", '"_dP')

-- Insert blank lines
map("n", "[<Space>", ':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>')
map("n", "]<Space>", ':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[-1"<CR>')

-- Switch case
map("n", "<leader>`", "~")

-- Substitute word under cursor, press . for next substitution
map("n", "<leader>c", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn")
map("x", "<leader>c", '"sy:let @/=@s<CR>cgn')

-- File-wide substitute word under cursor
map("n", "<leader>C", ":%s/<C-r><C-w>//<Left>")
map("x", "<leader>C", '"sy:%s/<C-r>s//<Left>')

-- Skip word in insert and command mode
map("i", "<A-Right>", "<S-Right>")
map("i", "<A-Left>", "<S-Left>")
map("c", "<A-Right>", "<S-Right>")
map("c", "<A-Left>", "<S-Left>")

-- Go to start of command
map("c", "<C-A>", "<Home>")

-- Make word uppercase
map("n", "<leader>u", "gUiw")

-- Quickfix list mappings
map("n", "<leader>qo", "<cmd>copen<CR>")
map("n", "<leader>qq", "<cmd>cclose<CR>")
map("n", "[q", "<cmd>cprevious<CR>")
map("n", "]q", "<cmd>cnext<CR>")

-- Join lines (J is already used for vertical navigation)
map("n", "<leader>j", "J")

-- Add single space after the cursor in normal mode
map("n", "<leader><space>", "a<space><esc>")

-- Move with Alt+hjkl in insert mode
map("i", "<A-h>", '<Left>')
map("i", "<A-j>", '<Down>')
map("i", "<A-k>", '<Up>')
map("i", "<A-l>", '<Right>')
