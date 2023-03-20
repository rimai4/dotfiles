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

-- Map jk to escape
map("i", "jk", "<Esc>")

-- Yank to clipboard
map("v", "y", '"+y')
map("n", "y", '"+y')
map("n", "Y", '"+yg_')
map("n", "yy", '"+yy')

-- Move between buffers with <C-h> and <C-l>
map("n", "<C-h>", "<cmd>bp<CR>")
map("n", "<C-l>", "<cmd>bn<CR>")

-- Increment/decrement numbers
map("n", "-", "<C-x>")
map("n", "+", "<C-a>")

-- Don't replace register after pasting
map("v", "p", '"_dP')

-- Insert blank lines
map("n", "[<Space>", ':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>')
map("n", "]<Space>", ':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[-1"<CR>')
map("i", "<C-CR>", "<Esc>o")

-- Switch case
map("n", "<leader>`", "~")

-- Substitute word under cursor, press . for next substitution
map("n", "<leader>c", ":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn")

-- File-wide substitute word under cursor
map("n", "<leader>C", ":%s/<C-r><C-w>")

-- Make word uppercase
map("n", "<leader>u", "gUiw")
