local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")

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
				["<esc>"] = actions.close,
				["<C-t>"] = layout.toggle_preview,
			},
		},
    preview_cutoff = 1
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
	},
})

require("telescope").load_extension("fzf")
