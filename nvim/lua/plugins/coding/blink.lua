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
      --   "mgalliou/blink-cmp-tmux",
      -- },
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
        -- INFO: disable `snippet_forward` from going out of `className="|"` to `className=""| to help with supermaven tab completion`
        ["<Tab>"] = { "fallback" },
      },
      -- This is having issue for some reason but don't really know and don't have time to be bothered
      sources = {
        -- default = {
        --   "tmux",
        -- },
        providers = {
          -- tmux = {
          --   module = "blink-cmp-tmux",
          --   name = "tmux",
          --   -- default options
          --   opts = {
          --     all_panes = true,
          --     capture_history = false,
          --     -- only suggest completions from `tmux` if the `trigger_chars` are
          --     -- used
          --     triggered_only = false,
          --     trigger_chars = { "." },
          --   },
          -- },
        },
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
          winblend = vim.o.pumblend,
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
