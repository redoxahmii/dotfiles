vim.keymap.set("i", "t", require("redox.javascript").add_async, { buffer = true })

if _G.MiniAi ~= nil then
  vim.b.miniai_config = {
    custom_textobjects = {
      r = _G.MiniAi.gen_spec.treesitter({ a = "@attribute_name", i = "@attribute_name" }),
    },
  }
end
