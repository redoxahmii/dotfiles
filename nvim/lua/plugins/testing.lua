return {
  {
    "eero-lehtinen/oklch-color-picker.nvim",
    event = "BufRead",
    version = "*",
    opts = {},
  },
  {
    "S1M0N38/love2d.nvim",
    event = "VeryLazy",
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
