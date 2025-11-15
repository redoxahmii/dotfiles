return {
  {
    "flash.nvim",
    opts = {
      search = {
        mode = function(str)
          return "\\<" .. str
        end,
      },
      label = {
        uppercase = false,
      },
      highlight = {
        backdrop = false,
        matches = false,
      },
      modes = {
        char = {
          highlight = {
            backdrop = false,
            matches = false,
          },
        },
        treesitter = {
          label = { before = true, after = true, style = "inline" },
          highlight = {
            backdrop = false,
            matches = false,
          },
        },
        treesitter_search = {
          remote_op = { restore = true, motion = true },
        },
      },
    },
  },
}
