---@diagnostic disable: inject-field
return {
  --- [INFO: Add tokyonight with transparent sidebars and floats]
  {
    "folke/tokyonight.nvim",
    lazy = true,
    dev = false,
    enabled = false,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup({
        -- transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          hl.LineNrAbove = { fg = c.dark5 }
          hl.LineNrBelow = { fg = c.dark5 }
        end,
      })
    end,
  },
  {
    "catppuccin",
    enabled = false,
  },
  --- [INFO: Add rainbow markdown colors to solarized-osaka]
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    dev = false,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("solarized-osaka").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
        on_highlights = function(hl, c)
          local util = require("solarized-osaka.util")
          local markdown_rainbow = { c.blue, c.yellow, c.green, c.red, c.magenta, c.cyan }
          for i, color in ipairs(markdown_rainbow) do
            hl["@markup.heading." .. i .. ".markdown"] = { fg = color, bold = true }
            hl["Headline" .. i] = { bg = util.darken(color, 0.05) }
            hl["keyword.tsx"] = { fg = util.darken(c.green500, 0.85) }
            hl["keyword.return.tsx"] = { fg = util.darken(c.green500, 0.85) }
            hl["keyword.javascript"] = { fg = util.darken(c.green500, 0.85) }
            hl["keyword.return.javascript"] = { fg = util.darken(c.green500, 0.85) }
          end
          hl.CursorLineNr = { fg = c.cyan500 }
          -- hl.WinSeparator = { fg = c.TabLineSel }
          hl.LineNrAbove = { fg = c.orange700 }
          hl.LineNrBelow = { fg = c.orange700 }
          hl.BlinkCmpMenu = { fg = c.base01, bg = c.none }
          hl.SkActive = { fg = c.cyan, bg = c.base03 }
          hl.SkInactive = { fg = c.magenta, bg = c.base03 }
          -- hl.NeoWarrior = { fg = c.cyan, bg = c.none }
          -- hl.NeoWarriorTextDim = { fg = "#6e6a86", bg = nil }
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
