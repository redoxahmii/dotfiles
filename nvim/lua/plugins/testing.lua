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
  --   "rachartier/tiny-glimmer.nvim",
  --   event = "VeryLazy",
  --   priority = 10, -- Low priority to catch other plugins' keybindings
  --   config = function()
  --     require("tiny-glimmer").setup({
  --       overwrite = {
  --         undo = {
  --           enabled = true,
  --         },
  --         redo = {
  --           enabled = true,
  --         },
  --       },
  --     })
  --   end,
  -- },
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
  -- {
  --   "LazyVim/LazyVim",
  --   version = false,
  -- },
  -- {
  --   "brenoprata10/nvim-highlight-colors",
  --   event = "BufRead",
  --   opts = {},
  -- },
}
