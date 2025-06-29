return {
  -- {
  --   "kawre/leetcode.nvim",
  --   lazy = true,
  --   dependencies = {
  --     "ibhagwan/fzf-lua",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --   },
  --   opts = {
  --     arg = "leetcode",
  --     lang = "javascript",
  --     image_support = true,
  --   },
  -- },
  {
    "eero-lehtinen/oklch-color-picker.nvim",
    event = "VeryLazy",
    version = "*",
    ---@type oklch.Opts
    opts = {},
  },
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
