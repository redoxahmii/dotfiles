return {
  {
    "echasnovski/mini.diff",
    lazy = true,
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        -- Disabled by default
        source = diff.gen_source.none(),
      })
    end,
  },
  -- {
  --   "ravitemer/mcphub.nvim",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   build = "npm install -g mcp-hub@latest", -- Installs `mcp-hub` node binary globally
  --   keys = {
  --     { "<leader>am", "<cmd>MCPHub<cr>", desc = "McpHub" },
  --   },
  --   config = function()
  --     require("mcphub").setup({
  --       shutdown_delay = 300000,
  --       ui = {
  --         wo = {
  --           winhl = "Border:MCPHubNormal,FloatBorder:SnacksPickerBorder",
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "olimorris/codecompanion.nvim",
    lazy = true,
    opts = {
      strategies = {
        chat = {
          variables = {
            ["buffer"] = {
              opts = {
                default_params = "watch", -- or 'watch'
              },
            },
          },
        },
      },
      extensions = {
        history = {
          enabled = true,
          opts = {
            -- Keymap to open history from chat buffer (default: gh)
            keymap = "gh",
            -- Keymap to save the current chat manually (when auto_save is disabled)
            save_chat_keymap = "sc",
            -- Save all chats by default (disable to save only manually using 'sc')
            auto_save = true,
            -- Number of days after which chats are automatically deleted (0 to disable)
            expiration_days = 5,
            -- Picker interface ("telescope" or "snacks" or "fzf-lua" or "default")
            picker = "fzf-lua",
            ---Automatically generate titles for new chats
            auto_generate_title = true,
            title_generation_opts = {
              ---Adapter for generating titles (defaults to active chat's adapter)
              adapter = nil, -- e.g "copilot"
              ---Model for generating titles (defaults to active chat's model)
              model = nil, -- e.g "gpt-4o"
            },
            ---On exiting and entering neovim, loads the last chat on opening chat
            continue_last_chat = true,
            ---When chat is cleared with `gx` delete the chat from history
            delete_on_clearing_chat = true,
            ---Directory path to save the chats
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
            ---Enable detailed logging for history extension
            enable_logging = false,
          },
        },
        -- vectorcode = {
        --   opts = {
        --     add_tool = true,
        --   },
        -- },
        -- mcphub = {
        --   callback = "mcphub.extensions.codecompanion",
        --   opts = {
        --     show_result_in_chat = true, -- Show mcp tool results in chat
        --     make_vars = true, -- Convert resources to #variables
        --     make_slash_commands = true, -- Add prompts as /slash commands
        --   },
        -- },
      },
    },
    keys = {
      { "<leader>aa", "<cmd>CodeCompanionChat<cr>", desc = "Toggle CodeCompanion Chat" },
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Prompt Actions (CodeCompanion" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "ravitemer/codecompanion-history.nvim",
    },
  },
}
