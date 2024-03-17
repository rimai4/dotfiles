-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Apply macro over visual selection
vim.cmd([[
  xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

  function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
  endfunction
]])

-- Don't show quickfix buffer
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

-- Always start terminals in insert mode
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	pattern = "term://*",
	callback = function()
		vim.cmd("startinsert")
	end,
})

-- Close diffview with q
vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter" }, {
	pattern = "diffview://*",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>tabclose<cr>", {})
	end,
})

-- Set htmldjango filetype
vim.cmd("autocmd BufRead,BufNewFile *.djhtml set filetype=htmldjango")

-- Add templ filetype
vim.filetype.add({ extension = { templ = "templ" } })
