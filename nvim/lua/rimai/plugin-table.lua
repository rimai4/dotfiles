return {
  {
    "sainnhe/sonokai",
    lazy = true,
    priority = 1000,
  },
  "samjwill/nvim-unception",
  "kevinhwang91/nvim-hlslens",
  "nvim-tree/nvim-web-devicons",
  {
    "machakann/vim-sandwich",
    keys = {
      { "sa", mode = { "n", "v" } },
      { "sr" },
      { "sd" },
    },
  },
  "RRethy/nvim-treesitter-endwise",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "nvim-treesitter/nvim-treesitter-textobjects",
  {
    "numToStr/FTerm.nvim",
    opts = {
      border = "double",
      dimensions = {
        height = 0.9,
        width = 0.9,
      },
    },
    config = function(_, opts)
      local fterm = require("FTerm")
      fterm.setup(opts)
      require("rimai.plugins.fterm")
    end,
    keys = { "<A-i>", "<A-g>", "<A-n>" },
  },
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      hooks = {
        pre = function()
          require("ts_context_commentstring.internal").update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local function cwd()
        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      end

      return {
        options = { theme = "sonokai" },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            {
              "filename",
              path = 1,
            },
          },
          lualine_c = {},
          lualine_x = { "branch", "diagnostics" },
          lualine_y = { cwd },
          lualine_z = {},
        },
      }
    end,
  },
  {
    "akinsho/bufferline.nvim",
    branch = "v3.0.0",
    opts = {
      options = {
        max_name_length = 15,
        tab_size = 15,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
    event = "VeryLazy",
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    config = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
    event = { "BufReadPre", "BufNewFile" },
  },
  "windwp/nvim-ts-autotag",
  {
    "windwp/nvim-autopairs",
    config = true,
    event = "VeryLazy",
  },
  {
    "monaqa/dial.nvim",
    config = function()
      vim.keymap.set("n", "+", require("dial.map").inc_normal(), { noremap = true })
      vim.keymap.set("n", "-", require("dial.map").dec_normal(), { noremap = true })

      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.constant.alias.bool,
          augend.constant.new({ elements = { "True", "False" } }),
        },
      })
    end,
    keys = { "+", "-" },
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>sf", "<cmd>Telescope find_files<CR>", { desc = "[S]earch [f]iles" } },
      { "\\", "<cmd>Telescope find_files hidden=true<CR>", { desc = "[\\] - Search files" } },
      { "<leader>sb", "<cmd>Telescope buffers<CR>", { desc = "[S]earch [b]uffers" } },
      { "<leader>sw", "<cmd>Telescope grep_string<CR>", { desc = "[S]earch by [w]ord" } },
      { "<leader>sg", "<cmd>Telescope live_grep<CR>", { desc = "[S]earch by [g]rep" } },
      { "<leader>sh", "<cmd>Telescope help_tags<CR>", { desc = "[S]earch [h]elp" } },
      { "<leader>sd", "<cmd>Telescope diagnostics<CR>", { desc = "[S]earch [d]iagnostics" } },
      { "<leader>sc", "<cmd>Telescope command_history<CR>", { desc = "[S]earch [c]ommand history" } },
      { "<leader>ss", "<cmd>Telescope lsp_document_symbols<CR>", { desc = "[S]earch [s]ymbols" } },
      {
        "<leader>sS",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
        { desc = "[S]earch workspace [S]ymbols" },
      },
      { "<leader>sr", "<cmd>Telescope resume<CR>", { desc = "[S]earch [r]esume" } },
      { "<leader>sR", "<cmd>Telescope lsp_references<CR>", { desc = "[S]earch workspace [R]eferences" } },
      { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "[G]it [S]tatus" },
    },
    opts = function()
      local actions = require("telescope.actions")
      local layout = require("telescope.actions.layout")

      return {
        defaults = {
          file_ignore_patterns = { "yarn.lock", ".git" },
          prompt_prefix = "   ",
          selection_caret = "  ",
          layout_config = {
            horizontal = {
              prompt_position = "top",
            },
          },
          sorting_strategy = "ascending",
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
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = function()
      vim.cmd("let g:neo_tree_remove_legacy_commands = 1")

      return {
        close_if_last_window = false,
        filesystem = {
          follow_current_file = true,
          use_libuv_file_watcher = true,
        },
      }
    end,
    keys = {
      { "<A-b>", "<cmd>Neotree toggle right<CR>" },
    },
  },
  "jose-elias-alvarez/null-ls.nvim",
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
