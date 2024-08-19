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

-- Yank to system clipboard with <leader>y
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

-- Go to the alternate file & center
map("n", "<leader>a", "<C-6>zz")

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

-- Switch tab
map({ "t", "i" }, "<C-Tab>", "<cmd>tabnext<cr>")

map("n", ">", ">>")
map("n", "<", "<<")

-- TERMINAL MAPPINGS
-- Move between splits in normal & terminal mode
map({ "n", "t" }, "<A-h>", "<cmd>wincmd h<CR>")
map({ "n", "t" }, "<A-j>", "<cmd>wincmd j<CR>")
map({ "n", "t" }, "<A-k>", "<cmd>wincmd k<CR>")
map({ "n", "t" }, "<A-l>", "<cmd>wincmd l<CR>")

-- Open terminal in right split
map("n", "tr", "<cmd>vs<cr><cmd>BufTermEnter<cr>")
