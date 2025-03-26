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
  --   "Xuyuanp/scrollbar.nvim",
  --   -- no setup required
  --   init = function()
  --     local group_id = vim.api.nvim_create_augroup("scrollbar_init", { clear = true })
  --
  --     vim.api.nvim_create_autocmd({ "BufEnter", "WinScrolled", "WinResized" }, {
  --       group = group_id,
  --       desc = "Show or refresh scrollbar",
  --       pattern = { "*" },
  --       callback = function()
  --         require("scrollbar").show()
  --       end,
  --     })
  --   end,
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
