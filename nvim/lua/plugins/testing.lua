return {
  {
    "kawre/leetcode.nvim",
    lazy = true,
    dependencies = {
      "ibhagwan/fzf-lua",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      arg = "leetcode",
      lang = "javascript",
      image_support = true,
    },
  },
  -- {
  --   "noice.nvim",
  --   opts = {
  --     cmdline = {
  --       view = "cmdline",
  --     },
  --   },
  -- },

  -- {
  --   "faker.nvim",
  --   name = "faker.nvim",
  --   dir = "~/Code/Neovim/faker.nvim",
  --   opts = {},
  -- },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "neovim/nvim-lspconfig",
  --   },
  --   opts = {},
  -- },
  -- {
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters = {
  --       prettier = {
  --         prepend_args = { "--single-quote" },
  --       },
  --     },
  --   },
  -- },
}
