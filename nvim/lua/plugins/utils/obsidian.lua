--- [INFO: Obsidian Notes]
return {
  {
    "epwalsh/obsidian.nvim",
    -- version = "*",
    lazy = true,
    dev = false,
    cmd = "ObsidianQuickSwitch",
    ft = "markdown",
    keys = {
      { "<leader>wW", mode = "n", "<cmd>ObsidianQuickSwitch<cr>", desc = "Obsidian Notes" },
    },

    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-treesitter/nvim-treesitter",
      "3rd/image.nvim",
    },
    opts = {
      ui = {
        enable = false,
      },
      disable_frontmatter = function()
        -- get name of current file
        local file_name = vim.fn.expand("%:t")
        if file_name == "daily.md" then
          return true
        end
      end,

      templates = {
        debug = true,
        folder = "~/Code/Obsidian/Templates",
      },
      daily_notes = {
        folder = "Daily",
        template = "/Daily Notes.md",
      },
      attachments = {
        img_folder = "Images",
      },
      follow_url_func = function(url)
        print("Opening URL: " .. url)
        vim.fn.jobstart({ "xdg-open", url }) -- linux
      end,
      workspaces = {
        {
          name = "personal",
          path = "~/Code/Obsidian/",
        },
      },
      pickers = {
        name = "fzf-lua",
      },
    },
  },
}
