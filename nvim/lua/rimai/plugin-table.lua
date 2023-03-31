local bufferline_opts = require("rimai/plugins/bufferline")
local lualine_opts = require("rimai/plugins/lualine")

return {
  "jose-elias-alvarez/null-ls.nvim",
  "maxmellon/vim-jsx-pretty",
  "nvim-tree/nvim-web-devicons",
  "windwp/nvim-ts-autotag",
  "RRethy/nvim-treesitter-endwise",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "kevinhwang91/nvim-hlslens",
  "samjwill/nvim-unception",
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
    "echasnovski/mini.cursorword",
    version = "*",
    config = function()
      require("mini.cursorword").setup()
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
    "echasnovski/mini.indentscope",
    version = "*",
    config = function()
      require("mini.indentscope").setup()
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
  { "akinsho/bufferline.nvim",   branch = "v3.0.0",  opts = bufferline_opts },
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
