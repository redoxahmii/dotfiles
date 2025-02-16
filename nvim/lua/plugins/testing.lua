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
