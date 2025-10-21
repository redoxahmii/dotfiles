return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  lazy = true,
  config = function()
    require("incline").setup({
      window = { margin = { vertical = 1, horizontal = 1 } },
      hide = {
        cursorline = false,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
          filename = "[+] " .. filename
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)

        local elements = {
          { icon, guifg = color },
          { " " },
          { filename },
        }

        local has_sidekick, sidekick_status = pcall(require, "sidekick.status")
        if has_sidekick then
          local sessions = sidekick_status.cli()
          if #sessions > 0 then
            table.insert(elements, 3, { "𜱛 ", group = "Special" })
          end
        end

        return elements
      end,
    })
  end,
}
