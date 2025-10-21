return {
  {
    "zerochae/endpoint.nvim",
    dev = false,
    dependencies = {
      "folke/snacks.nvim",
    },
    cmd = { "Endpoint" },
    opts = {
      picker = {
        type = "snacks",
      },
    },
    keys = {
      { "<leader>ce", "<cmd>Endpoint<cr>", desc = "Show Endpoints in a Project" },
    },
  },
}
