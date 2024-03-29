return {
	"boltlessengineer/bufterm.nvim",
	opts = {
		save_native_terms = true, -- integrate native terminals from `:terminal` command
		start_in_insert = true, -- start terminal in insert mode
		remember_mode = true, -- remember vi_mode of terminal buffer
		enable_ctrl_w = true, -- use <C-w> for window navigating in terminal mode (like vim8)
		terminal = { -- default terminal settings
			buflisted = false, -- whether to set 'buflisted' option
			termlisted = true, -- list terminal in termlist (similar to buflisted)
			fallback_on_exit = true, -- prevent auto-closing window on terminal exit
			auto_close = true, -- auto close buffer on terminal job ends
		},
	},
	event = "VeryLazy", -- always load on startup
	keys = {
		{ "]]", "<cmd>BufTermNext<cr>" },
		{ "[[", "<cmd>BufTermPrev<cr>" },
		{
			"<leader><CR>",
			"<cmd>BufTermEnter<cr>",
		},
	},
}
