local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", "<leader>rr", require("redox.nice").remove_comments, { desc = "Remove comments" })
map("n", "<leader>gp", require("redox.nice").open_plugin_github, { desc = "Open Plugin Github" })
map("n", "<leader>ra", require("redox.nice").fix_unescaped_entities, { desc = "Fix unescaped entities" })
map("n", "<leader>gu", require("redox.nice").open_git_changes, { desc = "Open all git changes" })
map(
  "n",
  "<leader>rw",
  require("redox.nice").fix_suggested_canonical_classes,
  { desc = "Fix suggested canonical classes" }
)

-- vim.keymap.set({ "v" }, "<Leader>re", require("react-extract").extract_to_current_file)
-- vim.keymap.set({ "v" }, "<Leader>rw", require("react-extract").extract_to_new_file)
-- vim.keymap.del("n", "<C-/>", opts)
--
vim.keymap.del({ "n", "t" }, "<c-/>")
vim.keymap.del({ "n", "t" }, "<c-_>")
map({ "n", "t" }, "<c-/>", '<cmd>:lua Snacks.terminal({"trans"})<cr>', { desc = "Launch Translator" })
map({ "n", "t" }, "<c-_>", '<cmd>:lua Snacks.terminal({"trans"})<cr>', { desc = "Launch Translator" })

-- map("n", "<leader>rw", require("redox.nice").surrounding_tags, { desc = "Remove surrounding tags" })

map("n", "<leader>wt", "<cmd>NeoWarriorOpen<cr>", { desc = "Task list" })
--INFO: set ft to bigfile so snacks.nvim disables all highlighting and treesitter
--
map("n", "<leader>uB", "<cmd>set ft=bigfile<CR>", { desc = "Big file" })

--INFO: Replace hex with HSL
map("n", "<leader>rh", function()
  require("redox.hsl").replaceHexWithHSL()
end, { desc = "Replace Hex with HSL" })

map("n", "<leader>rq", function()
  require("redox.hsl").replaceHSLtoHex()
end, { desc = "Replace HSL with Hex" })

--INFO: Keep my yank register clean
map("n", "d", '"dd', opts)
map("v", "d", '"dd', opts)
map("n", "c", '"cc', opts)
map("v", "c", '"cc', opts)
map("n", "x", '"_x', opts)
map("v", "p", '"_dP', opts)
map("n", "yc", "yy<cmd>normal gcc<CR>p", { desc = "Yank and copy" })

--INFO: Go to next/prev hunks
-- map("n", "<C-j>", function()
--   signs.nav_hunk("next")
-- end, opts)
-- map("n", "<C-k>", function()
--   signs.nav_hunk("prev")
-- end, opts)

--INFO: center
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)

--INFO: find and center
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

--INFO: use escape to go out in temrinal
map("t", "<Esc>", "<C-\\><C-n>", opts)
