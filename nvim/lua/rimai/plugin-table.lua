local bufferline_opts = require("rimai/plugins/bufferline")
local lualine_opts = require("rimai/plugins/lualine")

return {
  "samjwill/nvim-unception",
  "jose-elias-alvarez/null-ls.nvim",
  "nvim-tree/nvim-web-devicons",
  "windwp/nvim-ts-autotag",
  "kevinhwang91/nvim-hlslens",
  "RRethy/nvim-treesitter-endwise",
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("mini.surround").setup()
    end,
  },
  {
    "echasnovski/mini.pairs",
    version = "*",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.comment",
    version = "*",
    config = function()
      require("mini.comment").setup()
    end,
  },
  {
    "numToStr/FTerm.nvim",
    opts = {
      hl = "BufferVisible",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    },
  },
  { "nvim-lualine/lualine.nvim", opts = lualine_opts },
  { "akinsho/bufferline.nvim", branch = "v3.0.0", opts = bufferline_opts },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
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
