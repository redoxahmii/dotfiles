return {
  -- {
  --   "eero-lehtinen/oklch-color-picker.nvim",
  --   event = "BufRead",
  --   version = "*",
  --   opts = {},
  -- },
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
  --   "brenoprata10/nvim-highlight-colors",
  --   event = "BufRead",
  --   opts = {},
  -- },
  {
    "S1M0N38/love2d.nvim",
    ft = "lua",
    opts = {},
    keys = {
      { "<leader>v", ft = "lua", desc = "LÖVE" },
      { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
      { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
    },
  },
  -- {
  --   "luckasRanarison/tailwind-tools.nvim",
  --   cmd = "TailwindSort",
  --   name = "tailwind-tools",
  --   build = ":UpdateRemotePlugins",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "neovim/nvim-lspconfig",
  --   },
  --   opts = {},
  -- },
}
