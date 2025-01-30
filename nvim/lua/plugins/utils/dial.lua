return {
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")
      opts.groups.typescript = vim.list_extend(
        opts.groups.typescript,
        { augend.constant.new({ elements = { "function", "export default function", "export function" } }) }
      )
    end,
  },
}
