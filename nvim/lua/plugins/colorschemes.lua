---@diagnostic disable: inject-field
return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    dev = false,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        hl.LineNrAbove = { fg = c.dark5 }
        hl.LineNrBelow = { fg = c.dark5 }
      end,
    },
  },
  {
    "catppuccin",
    enabled = false,
  },
  -- {
  --   "maxmx03/solarized.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   ---@type solarized.config
  --   opts = {},
  --   config = function(_, opts)
  --     vim.o.termguicolors = true
  --     vim.o.background = "light"
  --     require("solarized").setup(opts)
  --   end,
  -- },

  --- [INFO: Add rainbow markdown colors to solarized-osaka]
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    dev = false,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("solarized-osaka").setup({
        transparent = true,
        day_brightness = 0.3,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          local util = require("solarized-osaka.util")
          local markdown_rainbow = { c.blue, c.yellow, c.green, c.red, c.magenta, c.cyan }
          for i, color in ipairs(markdown_rainbow) do
            hl["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
            hl["Headline" .. i] = { bg = util.darken(color, 0.15) }
            hl["RenderMarkdownH" .. i .. "Bg"] = { bg = util.darken(color, 0.15) }
            hl["RenderMarkdownH" .. i .. "Fg"] = { fg = color, bold = true }
          end
          hl.RenderMarkdownBullet = { fg = c.orange }
          hl["keyword.tsx"] = { fg = util.darken(c.green500, 0.85) }
          hl["keyword.return.tsx"] = { fg = util.darken(c.green500, 0.85) }
          hl["keyword.javascript"] = { fg = util.darken(c.green500, 0.85) }
          hl["keyword.return.javascript"] = { fg = util.darken(c.green500, 0.85) }
          hl.CursorLineNr = { fg = c.cyan500, bold = true }
          hl.LineNrAbove = { fg = c.orange700 }
          hl.LineNrBelow = { fg = c.orange700 }
          hl.BlinkCmpMenu = { fg = c.base01, bg = c.none }
          -- showmekeys
          hl.SkActive = { fg = c.cyan, bg = c.base03 }
          hl.SkInactive = { fg = c.magenta, bg = c.base03 }
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "solarized-osaka",
    },
  },
}
