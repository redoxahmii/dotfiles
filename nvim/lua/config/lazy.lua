local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {

    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.typescript" },

    { import = "lazyvim.plugins.extras.lang.tailwind" },

    { import = "lazyvim.plugins.extras.vscode" },

    { import = "lazyvim.plugins.extras.linting.eslint" },

    { import = "lazyvim.plugins.extras.coding.mini-surround" },
    { import = "lazyvim.plugins.extras.editor.dial" },
    { import = "lazyvim.plugins.extras.editor.inc-rename" },

    { import = "lazyvim.plugins.extras.formatting.prettier" },

    { import = "plugins" },
    { import = "plugins.coding" },
    { import = "plugins.ui" },
    { import = "plugins.utils" },
  },
  defaults = {

    lazy = false,

    version = false,
  },

  checker = {
    enabled = true,
    -- frequency = 604800,
  },

  dev = {
    path = "~/Code/Neovim/",
  },
  performance = {
    rtp = {

      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font"
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_transparency = 0.6
end
