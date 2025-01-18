return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
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
  -- TODO: opened PR on main branch and should have some issues so have to wait for it to remove `telescope.nvim` as dep
  {
    "duckdm/neowarrior.nvim",
    dev = true,
    lazy = false,
    opts = {
      colors = {
        neowarrior = { group = "TroubleIconField" },
        neowarrior_inverted = { group = "IncSearch" },
        default = { group = "" },
        dim = { group = "Whitespace" },
        danger = { group = "ErrorMsg" },
        warning = { group = "WarningMsg" },
        success = { group = "FloatTitle" },
        info = { group = "Question" },
        danger_bg = { group = "ErrorMsg" },
        project = { group = "Directory" },
      },
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
