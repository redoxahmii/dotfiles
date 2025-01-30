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
      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          -- "dictionary",
        },
        providers = {
          -- dictionary = {
          --   module = "blink-cmp-dictionary",
          --   name = "Dict",
          --   min_keyword_length = 3,
          --   score_offset = 2,
          --   opts = {
          --     dictionary_directories = { vim.fn.expand("~/.config/nvim/lua/redox/dictionaries/") },
          --     separate_output = function(output)
          --       local items = {}
          --       for line in output:gmatch("[^\r\n]+") do
          --         table.insert(items, {
          --           label = line,
          --           insert_text = line,
          --           documentation = nil,
          --         })
          --       end
          --       return items
          --     end,
          --   },
          -- },
        },
        cmdline = function()
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
      completion = {
        menu = {
          scrollbar = false,
          auto_show = true,
          winblend = vim.o.pumblend,
          draw = {
            treesitter = {},
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
          },
        },
        -- list = {
        --   selection = { preselect = true },
        -- },
        -- trigger = {
        --   -- prefetch_on_insert = true,
        --   -- show_on_accept_on_trigger_character = false,
        --   -- show_on_insert_on_trigger_character = false,
        --   -- show_on_x_blocked_trigger_characters = { "'", '"', "(", ">", ",", "{" },
        --   -- show_on_trigger_character = false,
        -- },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          update_delay_ms = 0,
        },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
      },
    },
  },
}
