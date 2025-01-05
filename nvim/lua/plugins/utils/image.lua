--- [INFO: Image preview]
return {
  "3rd/image.nvim",
  lazy = true,
  keys = {
    {
      "<leader>uq",
      function()
        vim.notify("Image Preview Enabled!")
      end,
      mode = "n",
      desc = "Enable Images",
    },
  },
  opts = function()
    require("image").setup({
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          filetypes = { "markdown", "mdx" },
          only_render_image_at_cursor = true,
          floating_windows = true,
          download_remote_images = true,
        },
      },
    })
  end,
}
