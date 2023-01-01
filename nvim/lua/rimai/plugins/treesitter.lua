require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "help",
    "lua",
    "javascript",
    "typescript",
    "ruby",
    "tsx",
    "css",
    "scss",
    "json",
    "python",
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false,
  },
  endwise = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
  }
})
