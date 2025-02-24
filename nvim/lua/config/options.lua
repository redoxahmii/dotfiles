require("redox.nice").set_shada()
vim.opt.scrolloff = 10
vim.g.leader = " "
vim.opt.diffopt = "vertical"
vim.opt.wrap = true
vim.opt.wildignore:append({ "*/node_modules/*" })

-- show errors on line numbers
-- vim.opt.numberwidth = 3
-- vim.opt.signcolumn = "yes:1"
-- vim.opt.statuscolumn = "%l%s"

-- vim.g.lazyvim_prettier_needs_config = false
-- vim.opt.cursorline = false
-- vim.opt.list = true
-- vim.opt.listchars = { tab = "» ", trail = "·", eol = "↲" }
