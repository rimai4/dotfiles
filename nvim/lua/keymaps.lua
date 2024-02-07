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

-- Page up/down & center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "K", "<C-u>zz")
map("n", "J", "<C-d>zz")
map("v", "K", "<C-u>zz")
map("v", "J", "<C-d>zz")

-- Delete word in insert/command mode
map("i", "<A-BS>", "<C-w>")
map("c", "<A-BS>", "<C-w>")

-- Skip word in insert and command mode
map("i", "<A-Right>", "<S-Right>")
map("i", "<A-Left>", "<S-Left>")
map("c", "<A-Right>", "<S-Right>")
map("c", "<A-Left>", "<S-Left>")

-- Yank to clipboard
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>yy", '"+yy')

-- Clear search results with escape
map("n", "<Esc>", "<cmd>noh<CR><Esc>")

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

-- Go to start of command
map("c", "<C-A>", "<Home>")

-- Quickfix list mappings
map("n", "<leader>qo", "<cmd>copen<CR>")
map("n", "<leader>qq", "<cmd>cclose<CR>")
map("n", "[q", "<cmd>cprevious<CR>")
map("n", "]q", "<cmd>cnext<CR>")

-- Join lines (J is already used for vertical navigation)
map("n", "<leader>j", "J")

-- Add single space and paste after the cursor in normal mode
map("n", "<leader>p", "a<space><esc>p")

-- Unmap p in select mode (snippets)
map("s", "p", "<Nop>")

-- Make word upper case
map("n", "<leader>u", "gUiw")

-- Go to the alternate file
map("n", "<leader>a", "<C-6>")

-- Move between splits
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")
map("t", "<A-h>", "<C-\\><C-n><C-w>h")
map("t", "<A-j>", "<C-\\><C-n><C-w>j")
map("t", "<A-k>", "<C-\\><C-n><C-w>k")
map("t", "<A-l>", "<C-\\><C-n><C-w>l")

-- Escape in terminal mode
map("t", "<Esc>", "<C-\\><C-n>")

-- Open terminals
map("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>")
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>")
map("n", "<leader>t2h", "<cmd>2ToggleTerm direction=horizontal<CR>")
map("n", "<leader>t3h", "<cmd>3ToggleTerm direction=horizontal<CR>")
map("n", "<leader>t2v", "<cmd>2ToggleTerm direction=vertical<CR>")
map("n", "<leader>t3v", "<cmd>3ToggleTerm direction=vertical<CR>")

-- Switch tabs
map("n", "[t", "gT")
map("n", "]t", "gt")

-- Toggle line numbers
map("n", "<leader>tl", "<cmd>set number!<CR>")

-- Save with <leader>w to prevent quitting accidentally
map("n", "<leader>w", "<cmd>w<CR>")

-- Remap M to m (m is used for flash)
map("n", "M", "m")

-- Move left/right in command/insert mode with A-h and A-l
map("c", "<A-h>", "<Left>")
map("c", "<A-l>", "<Right>")
map("i", "<A-h>", "<Left>")
map("i", "<A-l>", "<Right>")
