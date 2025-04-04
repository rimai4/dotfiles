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

-- Go to start of command
map("c", "<C-a>", "<Home>")

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

-- Switch case and stay on same character
map("n", "`", "~h")

-- Substitute word under cursor. Press . for next substitution
map("n", "<leader>c", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn")
map("x", "<leader>c", '"sy:let @/=@s<CR>cgn')

-- File-wide substitute word under cursor
map("n", "<leader>C", ":%s/<C-r><C-w>//<Left>")
map("x", "<leader>C", '"sy:%s/<C-r>s//<Left>')

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

-- Move tabs
map("n", "[T", "<cmd>-tabmove<CR>")
map("n", "]T", "<cmd>+tabmove<CR>")

-- Toggle line numbers
map("n", "<leader>tl", "<cmd>set number!<CR>")

-- Save with <leader>w
map("n", "<leader>w", "<cmd>w<CR>")

-- Indent with single < or >
map("n", ">", ">>")
map("n", "<", "<<")

-- Center screen with a single z
map("n", "z", "zz")

-- Move between splits in normal & terminal mode
map({ "n", "t" }, "<C-h>", "<cmd>wincmd h<CR>")
map({ "n", "t" }, "<C-j>", "<cmd>wincmd j<CR>")
map({ "n", "t" }, "<C-k>", "<cmd>wincmd k<CR>")
map({ "n" }, "<C-l>", "<cmd>wincmd l<CR>")

-- Copy file path
vim.keymap.set("n", "<leader>fn", function()
	local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
	vim.fn.setreg('"', relative_path)
	print("Copied path: " .. relative_path)
end)

-- Copy file path to system clipboard
vim.keymap.set("n", "<leader>FN", function()
	local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
	vim.fn.setreg("+", relative_path)
	print("Copied path to system clipboard: " .. relative_path)
end)

-- Delete default LSP keymaps
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grr") -- gr
vim.keymap.del("n", "grn") -- <leader>rn
vim.keymap.del("n", "gra")

-- Toggle color column
vim.keymap.set("n", "<leader>tc", function()
	local current = vim.wo.colorcolumn
	if current == "120" then
		vim.wo.colorcolumn = ""
	else
		vim.wo.colorcolumn = "120"
	end
end)
