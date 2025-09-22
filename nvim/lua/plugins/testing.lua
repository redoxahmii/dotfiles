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
  {
    "napmn/react-extract.nvim",
    dev = true,
    event = "BufRead",
    opts = {},
  },
  {
    "zerochae/endpoint.nvim",
    dev = true,
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
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   event = "BufRead",
  --   opts = {},
  -- },
}
