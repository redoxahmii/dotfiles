return {
  {
    "kawre/leetcode.nvim",
    lazy = true,
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
  {
    "duckdm/neowarrior.nvim",
    dev = true,
    cmd = "NeoWarriorOpen",
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
