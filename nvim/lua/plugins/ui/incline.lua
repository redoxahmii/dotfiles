return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  lazy = true,
  config = function()
    local helpers = require("incline.helpers")
    local devicons = require("nvim-web-devicons")
    require("incline").setup({
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
      },
      render = function(props)
        local filepath = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":p:.")
        if filepath == "" then
          filepath = "[No Name]"
        end
        local ft_icon, ft_color = devicons.get_icon_color(filepath)
        local modified = vim.bo[props.buf].modified
        local res = {
          ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
          " ",
          { filepath, gui = modified and "bold,italic" or "bold" },
          group = "Normal",
        }

        local has_sidekick, sidekick_status = pcall(require, "sidekick.status")
        if has_sidekick then
          local sessions = sidekick_status.cli()
          if #sessions > 0 then
            table.insert(res, 2, { " 𜱛", group = "Special" })
          end
        end

        table.insert(res, " ")
        return res
      end,
    })
  end,
}
