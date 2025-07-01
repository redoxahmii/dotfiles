--- [INFO: Obsidian Notes]
return {
  {
    "obsidian-nvim/obsidian.nvim",
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
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
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
        vim.notify("Opening URL: " .. url, vim.log.levels.INFO)
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
