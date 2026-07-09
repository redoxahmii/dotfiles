--- [INFO: Obsidian Notes]
return {
  {
    "obsidian-nvim/obsidian.nvim",
    -- version = "*",
    lazy = true,
    dev = false,
    cmd = "Obsidian",
    ft = "markdown",
    keys = {
      { "<leader>wW", mode = "n", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian Notes" },
      { "<leader>ci", mode = "n", "<cmd>Obsidian paste_img<cr>", desc = "Paste Image" },
    },

    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      legacy_commands = false,
      -- frontmatter = {
      --   enabled = function()
      --     -- get name of current file
      --     local file_name = vim.fn.expand("%:t")
      --     if file_name == "daily.md" then
      --       return true
      --     end
      --   end,
      -- },
      ui = {
        enable = false,
      },
      templates = {
        folder = "Templates",
      },
      daily_notes = {
        folder = "Daily",
        template = "/Daily Notes.md",
      },
      attachments = {
        folder = "Images",
      },
      -- follow_url_func = function(url)
      --   vim.notify("Opening URL: " .. url, vim.log.levels.INFO)
      --   vim.fn.jobstart({ "xdg-open", url }) -- linux
      -- end,
      workspaces = {
        {
          name = "personal",
          path = "~/Code/Obsidian/",
        },
      },
    },
  },
}
