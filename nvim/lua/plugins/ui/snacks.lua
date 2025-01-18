return {
  {
    -- TODO: format proper
    "snacks.nvim",
    opts = {
      indent = {
        scope = {
          treesitter = {
            enabled = false,
          },
        },
      },
      scroll = {
        enabled = false,
      },
      dashboard = {
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            {
              icon = " ",
              key = "c",
              desc = "Config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = "󱞁 ", key = "w", desc = "Obsidian Notes", action = ":ObsidianQuickSwitch" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },

          header = [[
    ██████╗ ███████╗██████╗  ██████╗ ██╗  ██╗
    ██╔══██╗██╔════╝██╔══██╗██╔═══██╗╚██╗██╔╝
  ██████╔╝█████╗  ██║  ██║██║   ██║ ╚███╔╝
  ██╔══██╗██╔══╝  ██║  ██║██║   ██║ ██╔██╗
    ██║  ██║███████╗██████╔╝╚██████╔╝██╔╝ ██╗
    ╚═╝  ╚═╝╚══════╝╚═════╝  ╚═════╝ ╚═╝  ╚═╝
      ]],
        },
        sections = {
          { section = "header", padding = 1, align = "center" },
          { icon = " ", title = "Recent Files", section = "recent_files", limit = 4, padding = 1 },
          { section = "keys", gap = 1, padding = 1 },
          {
            pane = 2,
            icon = " ",
            desc = "Browse Repo",
            key = "b",
            action = function()
              Snacks.gitbrowse()
            end,
          },
          -- {
          --   pane = 2,
          --   icon = " ",
          --   desc = "Browse Todos",
          --   key = "d",
          --   action = function()
          --     vim.cmd("edit ~/Code/Obsidian/daily.md")
          --   end,
          -- },
          {
            pane = 2,
            icon = " ",
            desc = "Browse Todos",
            indent = 3,
            key = "d",
            action = function()
              vim.cmd("edit ~/Code/Obsidian/daily.md")
            end,
            section = "terminal",
            -- cmd = "bat --theme 'Solarized (dark)' -p ~/Code/Obsidian/daily.md",
            cmd = "task next",
            ttl = 60,
            height = 10,
          },

          function()
            local in_git = Snacks.git.get_root() ~= nil
            local cmds = {
              {
                title = "Notifications",
                cmd = "gh notify -s -a -n5",
                action = function()
                  vim.ui.open("https://github.com/notifications")
                end,
                -- key = "n",
                icon = " ",
                height = 8,
                enabled = true,
              },
              -- {
              --   title = "Open Issues",
              --   cmd = "gh issue list -L 3",
              --   key = "i",
              --   action = function()
              --     vim.fn.jobstart("gh issue list --web", { detach = true })
              --   end,
              --   icon = " ",
              --   height = 7,
              -- },
              -- {
              --   icon = " ",
              --   title = "Open PRs",
              --   cmd = "gh pr list -L 3",
              --   key = "p",
              --   action = function()
              --     vim.fn.jobstart("gh pr list --web", { detach = true })
              --   end,
              --   height = 7,
              -- },
              {
                icon = " ",
                section = "terminal",
                pane = 2,
                title = "Git Status",
                cmd = "git --no-pager diff --stat -B -M -C",
                height = 8,
              },
            }
            return vim.tbl_map(function(cmd)
              return vim.tbl_extend("force", {
                pane = 2,
                section = "terminal",
                enabled = in_git,
                ttl = 5 * 60,
                indent = 3,
              }, cmd)
            end, cmds)
          end,
          { section = "startup" },
        },
      },
    },
  },
}
