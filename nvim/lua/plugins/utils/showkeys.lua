return {
  {
    "nvzone/showkeys",
    dev = true,
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 1,
      maxkeys = 8,
      show_count = false,
      winhl = "FloatBorder:WhichKeyBorder,Normalfloat:Normal",
      -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
      position = "bottom-center",
      winopts = {
        focusable = false,
        relative = "editor",
        style = "minimal",
        border = "rounded",
        height = 1,
        row = 1,
        col = 0,
      },
    },
    keys = {
      { "<leader>k", "<cmd>ShowkeysToggle<cr>", desc = "Show Keys" },
    },
  },
}