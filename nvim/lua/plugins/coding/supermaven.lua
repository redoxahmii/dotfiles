--- [INFO: Supermaven autocomplete]
return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        accept_suggestion = "<tab>",
        clear_suggestion = "<A-c>",
        accept_word = "<A-w>",
      },
      ignore_filetypes = { "gitcommit", "gitrebase", "gitconfig" },
      log_level = "off",
    },
  },
}
