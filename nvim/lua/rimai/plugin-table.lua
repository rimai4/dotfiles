local bufferline_opts = require("rimai/plugins/bufferline")
local lualine_opts = require("rimai/plugins/lualine")
local neotree_opts = require("rimai/plugins/neo-tree")

return {
  "jose-elias-alvarez/null-ls.nvim",
  "maxmellon/vim-jsx-pretty",
  "nvim-tree/nvim-web-devicons",
  "machakann/vim-sandwich",
  "windwp/nvim-ts-autotag",
  "RRethy/nvim-treesitter-endwise",
  "nvim-treesitter/nvim-treesitter-textobjects",
  { "nvim-lualine/lualine.nvim", opts = lualine_opts },
  { "akinsho/bufferline.nvim", branch = "v3.0.0", opts = bufferline_opts },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = true,
  },
  {
    "akinsho/git-conflict.nvim",
    config = true,
  },
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    config = true,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  "nvim-telescope/telescope-file-browser.nvim",
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = neotree_opts,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    },
  },
}
