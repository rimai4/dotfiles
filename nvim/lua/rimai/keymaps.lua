local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

-- Swap ; and :
map("n", ";", ":")
map("n", ":", ";")
map("v", ";", ":")
map("v", ":", ";")

-- Go to start and end of line
map("", "H", "^")
map("", "L", "$")

-- Don't put single chars in register
map("n", "x", '"_x')

-- Map jk to Escape
map("i", "jk", "<Esc>")

-- Page up/down & center
map("n", "K", "<C-u>zz")
map("n", "J", "<C-d>zz")

-- Center cursor when navigating search results 
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Delete word in insert mode
map("i", "<A-BS>", "<C-w>")

-- Move lines
map("n", "<A-Down>", ":m .+1<CR>==")
map("n", "<A-Up>", ":m .-2<CR>==")
map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
map("v", "<A-Up>", ":m '<-2<CR>gv=gv")

-- Telescope
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = '[S]earch [F]iles'})
map("n", "\\", "<cmd>Telescope find_files<CR>", { desc = "[\\] - Search files"})
map("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = '[S]earch [B]uffers'})
map("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = '[S]earch by [W]ord'})
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = '[S]earch by [G]rep'})
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = '[S]earch [H]elp'})
map("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = '[S]earch [D]iagnostics'})
map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", { desc = '[S]earch [S]ymbols'})

-- Neotree
map("n", "<leader>b", "<cmd>Neotree toggle<CR>")
map("n", "<leader>n", "<cmd>Neotree reveal<CR>")

-- Paste to clipboard
map("v", "<leader>y", '"+y')
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", '"+yg_')
map("n", "<leader>yy", '"+yy')

-- Format
map("n", "<leader>f", "<cmd>Format<CR>")

-- Split navigation with Control-hjkl
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Clear search results with enter
map("n", "<CR>", "<cmd>noh<CR><CR>")

-- Insert blank lines
map("n", "[<Space>", ':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>')
map("n", "]<Space>", ':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[-1"<CR>')

-- Move between buffers with arrow keys
map("n", "<Left>", "<cmd>bp<CR>")
map("n", "<Right>", "<cmd>bn<CR>")

-- Close buffer
map("n", "<leader>w", "<cmd>bd<CR>")

-- Increment/decrement numbers
map("n", "-", "<C-x>")
map("n", "+", "<C-a>")

-- Terminal
-- map("t", "<leader><Space>", "<cmd>ToggleTerm<CR>")
-- map("n", "<leader><Space>", "<cmd>ToggleTerm<CR>")
map("t", "<Esc>", "<C-\\><C-n>")

-- Don't replace register after pasting
map("v", "p", '"_dP')

