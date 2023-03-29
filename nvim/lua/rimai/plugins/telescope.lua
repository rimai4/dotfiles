local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")

require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "yarn.lock", ".git" },
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
    preview_cutoff = 60,
    preview = {
      hide_on_startup = true,
    },
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
})

require("telescope").load_extension("fzf")
