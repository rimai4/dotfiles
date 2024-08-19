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

-- Close diffview with q
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "diffview://*",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>tabclose<cr>", {})
	end,
})

-- Set htmldjango filetype
vim.cmd("autocmd BufRead,BufNewFile *.djhtml set filetype=htmldjango")

-- Add templ filetype
vim.filetype.add({ extension = { templ = "templ" } })

-- Disable incremental selection in command-line window
-- Check first if the keymap exists for the buffer before deleting
vim.api.nvim_create_autocmd("CmdWinEnter", {
	callback = function()
		local keymaps = vim.api.nvim_buf_get_keymap(0, "n")

		for _, keymap in ipairs(keymaps) do
			if keymap.lhs == "<CR>" then
				vim.api.nvim_buf_del_keymap(0, "n", "<CR>")
				return
			end
		end
	end,
})

-- Escape/jk in terminal, but not for lazygit/fzf terminals
vim.api.nvim_create_autocmd("TermEnter", {
	callback = function()
		if string.find(vim.api.nvim_buf_get_name(0), "lazygit") then
			return
		end
		-- Fzf
		if string.find(vim.api.nvim_buf_get_name(0), "bin/sh") then
			return
		end

		vim.keymap.set("t", "jk", function()
			vim.cmd("stopinsert")
		end, { buffer = true })

		vim.keymap.set("t", "<Esc>", function()
			vim.cmd("stopinsert")
		end, { buffer = true })
	end,
})
