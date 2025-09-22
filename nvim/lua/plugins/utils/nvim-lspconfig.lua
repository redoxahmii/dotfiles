--- [INFO: ignore specific diagnostics]
return {
  {
    "neovim/nvim-lspconfig",
    -- version = "*",
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
        marksman = {
          enabled = false,
        },
        -- harper_ls = {
        --   -- filetypes = {
        --   --   "markdown",
        --   --   "markdown.mdx",
        --   --   "typst",
        --   -- },
        --   settings = {
        --     ["harper-ls"] = {
        --       linters = {
        --         SentenceCapitalization = false,
        --         SpellCheck = false,
        --       },
        --       markdown = {
        --         IgnoreLinkTitle = true,
        --       },
        --       userDictPath = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
        --       fileDictPath = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
        --     },
        --   },
        -- },
        -- tailwindcss = {
        --   root_dir = function(fname)
        --     local package_json_path = vim.fs.dirname(vim.fs.find("package.json", { path = fname, upward = true })[1])
        --     if not package_json_path then
        --       return nil
        --     end
        --
        --     local file = io.open(package_json_path .. "/package.json", "r")
        --     if not file then
        --       return nil
        --     end
        --
        --     local found = false
        --     for line in file:lines() do
        --       if line:match('"tailwindcss"%s*:') then
        --         found = true
        --         break
        --       end
        --     end
        --
        --     file:close()
        --
        --     if found then
        --       return package_json_path
        --     else
        --       return nil
        --     end
        --   end,
        -- },
        emmet_language_server = {
          -- TODO: find someway to detach in simple JS files.
          filetypes = {
            "css",
            "eruby",
            "html",
            "htmldjango",
            "javascriptreact",
            "less",
            "pug",
            "sass",
            "scss",
            "javascript",
            "typescript",
            "typescriptreact",
            "htmlangular",
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
        eslint = {
          flags = {
            allow_incremental_sync = false,
            debounce_text_changes = 1000,
            exit_timeout = 1500,
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
