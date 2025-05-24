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

-- Set htmldjango filetype
vim.cmd("autocmd BufRead,BufNewFile *.djhtml set filetype=htmldjango")
vim.cmd("autocmd BufRead,BufNewFile *.jinja set filetype=htmldjango")

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

-- Add FormatDisable and FormatEnable commands
vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

-- Yank ring
-- Shift numbered registers up (1 becomes 2, etc.)
local function yank_shift()
	for i = 9, 1, -1 do
		vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
	end
end

-- Create autocmd for TextYankPost event
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		local event = vim.v.event
		if event.operator == "y" then
			yank_shift()
		end
	end,
})
