return {
  -- {
  --   "saghen/blink.compat",
  --   version = "*",
  --   lazy = true,
  --   opts = {},
  -- },
  {
    "saghen/blink.cmp",
    dependencies = {
      -- {
      --   "Kaiser-Yang/blink-cmp-dictionary",
      --   dependencies = { "nvim-lua/plenary.nvim" },
      -- },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      },
      -- This is having issue for some reason but don't really know and don't have time to be bothered
      -- sources = {
      --   default = {
      --     "lsp",
      --     "path",
      --     "snippets",
      --     "buffer",
      --     -- "dictionary",
      --   },
      --   providers = {
      --     -- dictionary = {
      --     --   module = "blink-cmp-dictionary",
      --     --   name = "Dict",
      --     --   min_keyword_length = 3,
      --     --   score_offset = 2,
      --     --   opts = {
      --     --     dictionary_directories = { vim.fn.expand("~/.config/nvim/lua/redox/dictionaries/") },
      --     --     separate_output = function(output)
      --     --       local items = {}
      --     --       for line in output:gmatch("[^\r\n]+") do
      --     --         table.insert(items, {
      --     --           label = line,
      --     --           insert_text = line,
      --     --           documentation = nil,
      --     --         })
      --     --       end
      --     --       return items
      --     --     end,
      --     --   },
      --     -- },
      --   },
      -- },

      cmdline = {
        enabled = true,
        completion = { menu = { auto_show = true } },
        -- sources = { "cmdline" },
        sources = function()
          local type = vim.fn.getcmdtype()
          if type == "/" or type == "?" then
            return {}
            -- INFO:This shows buffer completions in search but i hate it
            -- return {"Buffer"}
          end
          -- Commands
          if type == ":" then
            return { "cmdline" }
          end
          return {}
        end,
      },
      -- fuzzy = {
      --   sorts = {
      --     function(a, b)
      --       if a.client_name == nil or b.client_name == nil then
      --         return
      --       end
      --       return b.client_name == "emmet_ls"
      --     end,
      --     -- default sorts
      --     "score",
      --     "sort_text",
      --   },
      -- },
      completion = {
        menu = {
          scrollbar = false,
          auto_show = true,
          -- winblend = vim.o.pumblend,
          draw = {
            treesitter = {},
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          },
        },
        -- documentation = {
        --   auto_show = true,
        --   auto_show_delay_ms = 200,
        --   update_delay_ms = 0,
        -- },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
      },
    },
  },
}
