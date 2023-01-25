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
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "[S]earch [F]iles" })
map("n", "\\", "<cmd>Telescope find_files<CR>", { desc = "[\\] - Search files" })
map("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "[S]earch [B]uffers" })
map("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "[S]earch by [W]ord" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "[S]earch by [G]rep" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "[S]earch [H]elp" })
map("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "[S]earch [S]ymbols" })
map("n", "<leader>b", "<cmd>Telescope file_browser<CR>")
map("n", "<leader>n", "<cmd>Telescope file_browser path=%:p:h<CR>")

-- Neotree
map("n", "<leader>tt", "<cmd>Neotree toggle<CR>")

-- Yank to clipboard
map("v", "y", '"+y')
map("n", "y", '"+y')
map("n", "Y", '"+yg_')
map("n", "yy", '"+yy')

-- Format
map("n", "<leader>f", "<cmd>Format<CR>")

-- Split navigation with Control-hjkl
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Split navigation in terminal mode
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Clear search results with enter
map("n", "<Esc>", "<cmd>noh<CR><Esc>")

-- Move between buffers with arrow keys
map("n", "<Left>", "<cmd>bp<CR>")
map("n", "<Right>", "<cmd>bn<CR>")

-- Close buffer
map("n", "<leader>w", "<cmd>bd<CR>")

-- Increment/decrement numbers
map("n", "-", "<C-x>")
map("n", "+", "<C-a>")

-- Escape terminal
map("t", "<Esc>", "<C-\\><C-n>")

-- Resize terminal & splits
map("n", "<S-Up>", "<cmd>res +5<CR>")
map("n", "<S-Down>", "<cmd>res -5<CR>")
map("n", "<S-Left>", "<cmd>vert res -5<CR>")
map("n", "<S-Right>", "<cmd>vert res +5<CR>")
map("t", "<S-Up>", "<cmd>res +5<CR>")
map("t", "<S-Down>", "<cmd>res -5<CR>")
map("t", "<S-Left>", "<cmd>vert res +5<CR>")
map("t", "<S-Right>", "<cmd>vert res -5<CR>")

-- Don't replace register after pasting
map("v", "p", '"_dP')

-- Insert blank lines
map("n", "[<Space>", ':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>')
map("n", "]<Space>", ':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[-1"<CR>')
map("i", "<C-CR>", "<Esc>o")

-- Select first match with *
map("n", "*", "*N")

-- Switch case
map("n", "<leader>`", "~")

-- Substitute word under cursor, press . for next substitution
map("n", "<leader>c", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn")
map("x", "<leader>c", '"sy:let @/=@s<CR>cgn')

-- File-wide substitute word under cursor
map("n", "<leader>C", ":%s/<C-r><C-w>//<Left>")
map("x", "<leader>C", '"sy:%s/<C-r>s//<Left>')

-- Skip word in insert mode
map("i", "<A-Right>", "<S-Right>")
map("i", "<A-Left>", "<S-Left>")

-- List git conflicts
map("n", "<leader>lc", "<cmd>GitConflictListQf<CR>")
