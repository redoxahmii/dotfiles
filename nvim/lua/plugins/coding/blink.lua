return {
  {
    "saghen/blink.cmp",
    -- dependencies = {
    --   {
    --     "saghen/blink.compat",
    --     -- optional = true, -- make optional so it's only enabled if any extras need it
    --     dev = true, -- make dev optional so it's only enabled if you're using nvim-dev
    --     opts = {},
    --     version = not vim.g.lazyvim_blink_main and "*",
    --   },
    -- },
    --@module 'blink.cmp'
    --@type blink.cmp.Config
    opts = {
      keymap = {
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
      },
      sources = {
        cmdline = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then
            return {}
            -- This shows buffer completions in search but i hate it
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
