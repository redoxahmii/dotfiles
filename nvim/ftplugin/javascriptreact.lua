--INFO: Automatically end a self-closing tag when pressing /
vim.keymap.set("i", "/", function()
  local node = vim.treesitter.get_node()
  if not node then
    return "/"
  end

  if node:type() == "jsx_opening_element" then
    local char_at_cursor = vim.fn.strcharpart(vim.fn.strpart(vim.fn.getline("."), vim.fn.col(".") - 2), 0, 1)
    local already_have_space = char_at_cursor == " "

    return already_have_space and "/>" or " />"
  end

  return "/"
end, { expr = true, buffer = true })

vim.keymap.set("i", "t", require("redox.javascript").add_async, { buffer = true })

if _G.MiniAi ~= nil then
  vim.b.miniai_config = {
    custom_textobjects = {
      r = _G.MiniAi.gen_spec.treesitter({ a = "@attribute_name", i = "@attribute_name" }),
    },
  }
end
