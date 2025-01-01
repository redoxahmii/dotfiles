--- [INFO: Supermaven autocomplete]
return {
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<tab>", false, mode = { "i", "s" } },
      { "<s-tab>", false, mode = { "i", "s" } },
    },
  },
  require("luasnip").filetype_extend("javascript", { "javascriptreact" }),
}
