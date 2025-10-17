return {
  {
    "eero-lehtinen/oklch-color-picker.nvim",
    event = "BufRead",
    version = "*",
    opts = {},
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
    },
  },

  -- {
  --   "amitds1997/remote-nvim.nvim",
  --   version = "*", -- Pin to GitHub releases
  --   dependencies = {
  --     "nvim-lua/plenary.nvim", -- For standard functions
  --     "MunifTanjim/nui.nvim", -- To build the plugin UI
  --   },
  --   config = true,
  -- },
  -- {
  --   "napmn/react-extract.nvim",
  --   dev = true,
  --   event = "BufRead",
  --   opts = {},
  -- },
  {
    "folke/todo-comments.nvim",
    dev = false,
    -- opts = {
    --   uda = {
    --     tags = {
    --       sherpa = 20,
    --     },
    --   },
    -- },
  },
  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        enabled = false,
      },
      cli = {
        mux = {
          backend = "tmux",
          enabled = true,
        },
      },
    },
  },
  {
    "zerochae/endpoint.nvim",
    dev = false,
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = { "Endpoint" },
    opts = {
      picker = {
        type = "snacks",
      },
    },
    keys = {
      { "<leader>ce", "<cmd>Endpoint<cr>", desc = "Show Endpoints in a Project" },
    },
  },
  {
    "LazyVim/LazyVim",
    version = false,
  },
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   event = "BufRead",
  --   opts = {},
  -- },
}
