--- [INFO: mason ensure install]
return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "css-lsp",
        -- "emmet-language-server",
      })
    end,
  },
}
