--- [INFO: Disable K hover command prompt]
return {
  "noice.nvim",
  opts = function(_, opts)
    opts.presets.lsp_doc_border = true
    -- opts.lsp.signature = {
    --   auto_open = { enabled = false },
    -- }
    opts.cmdline = {
      view = "cmdline",
      format = {
        cmdline = false,
        search = false,
        filter = false,
        lua = false,
        help = false,
      },
    }
    table.insert(opts.routes, {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = { skip = true },
    })
  end,
}
