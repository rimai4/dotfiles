local actions = require("telescope.actions")
local layout = require("telescope.actions.layout")

require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "yarn.lock", ".git" },
    mappings = {
      i = {
        ["<C-t>"] = layout.toggle_preview,
        ["<Esc>"] = actions.close,
      },
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
  },
})

require("telescope").load_extension("fzf")
