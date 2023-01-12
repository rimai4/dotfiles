local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")
local fb_actions = require("telescope").extensions.file_browser.actions

require("telescope").setup({
	defaults = {
		layout_config = {
			horizontal = {
				preview_cutoff = 80,
			},
		},
		mappings = {
			i = {
				["<C-k>"] = actions.preview_scrolling_up,
				["<C-j>"] = actions.preview_scrolling_down,
				["<C-t>"] = layout.toggle_preview,
				["<Esc>"] = actions.close,
			},
		},
		preview_cutoff = 1,
	},
	pickers = {
		buffers = {
			show_all_buffers = true,
			sort_lastused = false,
			mappings = {
				i = {
					["<C-d>"] = "delete_buffer",
				},
			},
		},
		find_files = {
			mappings = {
				i = {
					["<esc>"] = actions.close,
				},
			},
		},
	},
	extensions = {
		file_browser = {
			hijack_netrw = true,
			display_stat = false,
			mappings = {
				i = {
					["<C-d>"] = fb_actions.remove,
					["<C-c>"] = fb_actions.create,
					["<C-r>"] = fb_actions.rename,
					["<C-y>"] = fb_actions.copy,
					-- move cannot be mapped
				},
			},
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
