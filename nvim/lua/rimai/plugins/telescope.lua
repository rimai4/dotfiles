local actions = require "telescope.actions"

require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<c-k>"] = actions.preview_scrolling_up,
        ["<c-j>"] = actions.preview_scrolling_down,
        ["<esc>"] = actions.close,
      }
    }
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = false,
      mappings = {
        i = {
          ["<c-d>"] = "delete_buffer",
        }
      }
    }
  }
}

require('telescope').load_extension('fzf')
