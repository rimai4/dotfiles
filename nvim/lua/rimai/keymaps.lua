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

-- Map jk and <C-]> to Escape
map("i", "jk", "<Esc>")
map("i", "<C-]>", "<Esc>")

-- Page up/down & center
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "K", "<C-u>zz")
map("n", "J", "<C-d>zz")

-- Delete word in insert mode
map("i", "<A-BS>", "<C-w>")

-- Move lines
map("n", "<A-Down>", ":m .+1<CR>==")
map("n", "<A-Up>", ":m .-2<CR>==")
map("v", "<A-Down>", ":m '>+1<CR>gv=gv")
map("v", "<A-Up>", ":m '<-2<CR>gv=gv")

-- Telescope
map("n", "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "[S]earch [f]iles" })
map("n", "\\", "<cmd>Telescope find_files hidden=true<CR>", { desc = "[\\] - Search files" })
map("n", "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "[S]earch [b]uffers" })
map("n", "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "[S]earch by [w]ord" })
map("n", "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "[S]earch by [g]rep" })
map("n", "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "[S]earch [h]elp" })
map("n", "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "[S]earch [d]iagnostics" })
map("n", "<leader>sc", "<cmd>Telescope command_history<CR>", { desc = "[S]earch [c]ommand history" })
map("n", "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "[S]earch [s]ymbols" })
map("n", "<leader>sS", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "[S]earch workspace [S]ymbols" })
map("n", "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "[S]earch [r]esume" })
map("n", "<leader>sR", "<cmd>Telescope lsp_references<CR>", { desc = "[S]earch workspace [R]eferences" })

-- Neotree
map("n", "<A-b>", "<cmd>Neotree toggle right<CR>")

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
map("n", "<C-h>", "<cmd>bp<CR>")
map("n", "<C-l>", "<cmd>bn<CR>")

-- Close buffer/close all except current buffer
map("n", "<leader>w", "<cmd>bd<CR>")
map("n", "<leader>W", "<cmd>%bd|e#|bd#<CR>")

-- Increment/decrement numbers
map("n", "-", "<C-x>")
map("n", "+", "<C-a>")

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

-- Skip word in insert mode
map("i", "<A-Right>", "<S-Right>")
map("i", "<A-Left>", "<S-Left>")

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

-- Toggle floating terminal
map("n", "<A-i>", '<cmd>lua require("FTerm").toggle()<cr>')
map("t", "<A-i>", '<cmd>lua require("FTerm").toggle()<cr>')

-- Add fugitive in a new tab
map("n", "<A-g>", '<cmd>Gtabedit :<cr>')
