local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	if type(mode) == "table" then
		for _, tablemode in ipairs(mode) do
			vim.api.nvim_set_keymap(tablemode, lhs, rhs, options)
		end
	else
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	end
end

-- Swap ; and :
map({ "n", "v" }, ";", ":")
map({ "n", "v" }, ":", ";")

-- Go to start and end of line with H and L
map({ "n", "v", "s", "o" }, "H", "^")
map({ "n", "v", "s", "o" }, "L", "$")

-- Don't put single char deletes in register
map("n", "x", '"_x')

-- Page up/down & center
map({ "n", "v" }, "K", "<C-u>zz")
map({ "n", "v" }, "J", "<C-d>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Move backwards/forwards in jumplist & center
map("n", "<C-i>", "<C-i>zz")
map("n", "<C-o>", "<C-o>zz")

-- Yank to clipboard
map({ "n", "v" }, "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>yy", '"+yy')

-- Clear search results with escape
map("n", "<Esc>", "<cmd>noh<CR><Esc>")

-- Don't replace register after pasting
map("v", "p", '"_dP')

-- Insert blank lines
map("n", "[<Space>", ':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>')
map("n", "]<Space>", ':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[-1"<CR>')

-- Switch case and stay on same character
map("n", "`", "~h")

-- Substitute word under cursor. Press . for next substitution
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

-- Go to the alternate file
map("n", "<leader>a", "<C-6>zz")

-- Move between splits in normal & terminal mode
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")
map("t", "<A-h>", "<cmd>wincmd h<CR>")
map("t", "<A-j>", "<cmd>wincmd j<CR>")
map("t", "<A-k>", "<cmd>wincmd k<CR>")
map("t", "<A-l>", "<cmd>wincmd l<CR>")

-- Switch tabs
map("n", "[t", "gT")
map("n", "]t", "gt")

-- Toggle line numbers
map("n", "<leader>tl", "<cmd>set number!<CR>")

-- Save with <leader>w
map("n", "<leader>w", "<cmd>w<CR>")

-- Move left/right in command/insert mode with A-h and A-l
map({ "c", "i" }, "<A-h>", "<Left>")
map({ "c", "i" }, "<A-l>", "<Right>")

-- Escape in terminal mode
map("t", "<Esc>", "<C-\\><C-n>")
map("t", "jk", "<C-\\><C-n>")
