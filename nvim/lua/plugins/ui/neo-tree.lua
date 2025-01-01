--- [INFO: Decrease the width of neo tree]
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    event_handlers = {
      {
        event = "neo_tree_buffer_enter",
        handler = function()
          vim.cmd([[
          setlocal relativenumber
          setlocal numberwidth=1
        ]])
        end,
      },
    },
    window = {
      width = 28,
    },
    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 0,
      },
    },
  },
}
