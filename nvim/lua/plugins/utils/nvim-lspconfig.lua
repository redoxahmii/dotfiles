--- [INFO: ignore specific diagnostics]
return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    opts = {
      inlay_hints = { enabled = false },
      -- diagnostics = {
      --   signs = {
      --     text = {
      --       [vim.diagnostic.severity.ERROR] = "",
      --       [vim.diagnostic.severity.WARN] = "",
      --       [vim.diagnostic.severity.HINT] = "",
      --       [vim.diagnostic.severity.INFO] = "",
      --     },
      --     numhl = {
      --       --TODO:  change highlight groups
      --       [vim.diagnostic.severity.WARN] = "WarningMsg",
      --       [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      --       [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      --       [vim.diagnostic.severity.HINT] = "DiagnosticHint",
      --     },
      --   },
      -- },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
        vtsls = {
          -- root_dir = function(...)
          --   return require("lspconfig.util").root_pattern(".git")(...)
          -- end,
          settings = {
            implicitProjectConfiguration = {
              checkJs = true,
            },
          },
          handlers = {
            ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
              if result.diagnostics == nil then
                return
              end
              local idx = 1
              while idx <= #result.diagnostics do
                local entry = result.diagnostics[idx]
                if entry.code == 80001 then
                  table.remove(result.diagnostics, idx)
                else
                  idx = idx + 1
                end
              end
              vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
            end,
          },
        },
      },
    },
  },
}
