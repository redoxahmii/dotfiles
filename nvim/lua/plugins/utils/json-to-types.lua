return {
  {
    "Redoxahmii/json-to-types.nvim",
    build = "sh install.sh npm",
    -- ft = "json",
    dev = false,
    keys = {
      {
        "<leader>cU",
        "<CMD>ConvertJSONtoLang typescript<CR>",
        desc = "Convert JSON to TS",
      },
      {
        "<leader>ct",
        "<CMD>ConvertJSONtoLangBuffer typescript<CR>",
        desc = "Convert JSON to TS Buffer",
      },
      -- {
      --   "<leader>Rw",
      --   function()
      --     require("kulala.api").on("after_next_request", function(data)
      --       local filename = "kulala.json"
      --       local file = io.open(filename, "w")
      --       if not file then
      --         print("Error: Failed to open file for writing")
      --         return
      --       end
      --       file:write(data.body)
      --       file:close()
      --       vim.cmd("edit " .. filename)
      --       local buf = vim.api.nvim_get_current_buf()
      --       vim.cmd("ConvertJSONtoLang typescript")
      --       vim.api.nvim_buf_delete(buf, { force = true })
      --       os.remove(filename)
      --     end)
      --     require("kulala").run()
      --   end,
      --   desc = "Toggle API Callback for JSON to TS Buffer",
      -- },

      -- {
      --   "<leader>Rw",
      --   (function()
      --     local foo = false
      --     return function()
      --       local api = require("kulala.api")
      --       foo = not foo
      --       local state = foo and "enabled" or "disabled"
      --       vim.notify("API callback " .. state)
      --       api.on("after_request", function(data)
      --         if not foo then
      --           return
      --         end
      --         local filename = "kulala.json"
      --         local file = io.open(filename, "w")
      --         if not file then
      --           print("Error: Failed to open file for writing")
      --           return
      --         end
      --         file:write(data.body)
      --         file:close()
      --
      --         vim.cmd("edit " .. filename)
      --         local buf = vim.api.nvim_get_current_buf()
      --         vim.cmd("ConvertJSONtoLangBuffer typescript")
      --         vim.api.nvim_buf_delete(buf, { force = true })
      --         os.remove(filename)
      --       end)
      --     end
      --   end)(),
      --   desc = "Toggle API Callback for JSON to TS Buffer",
      -- },
    },
  },
}
