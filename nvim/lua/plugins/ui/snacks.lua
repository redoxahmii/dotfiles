return {
  {
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
          -- {
          --   section = "terminal",
          --   pane = 2,
          --   cmd = "img2art /home/redox/Pictures/allama-iqbal.png --threshold 50 --scale .34 --quant 16 --with-color",
          --   height = 27,
          --   width = 40,
          --   padding = -40,
          --   indent = 15,
          -- },
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
          {
            pane = 2,
            icon = " ",
            desc = "Browse Todos",
            indent = 3,
            key = "d",
            action = "<leader>wt",
            section = "terminal",
            cmd = "task list",
            padding = 1,
            ttl = 5 * 60,
            height = 15,
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
                key = "g",
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
