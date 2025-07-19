return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	event = "InsertEnter",
	version = "*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-j>"] = { "scroll_documentation_down" },
			["<C-k>"] = { "scroll_documentation_up" },
			["<C-f>"] = { "snippet_forward", "fallback" },
			["<C-b>"] = { "snippet_backward", "fallback" },
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		cmdline = {
			enabled = false,
		},
		completion = {
			keyword = {
				range = "full",
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 0,
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			accept = {
				auto_brackets = {
					enabled = false,
				},
			},
		},
		signature = { enabled = true },
		sources = {
			per_filetype = {
				sql = { "snippets", "dadbod", "buffer" },
			},
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
				buffer = {
					min_keyword_length = 2,
					score_offset = 20,
				},
				snippets = {
					min_keyword_length = 2,
				},
			},
		},
	},
}
