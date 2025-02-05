---@diagnostic disable: undefined-field
local M = {}

M.set_shada = function()
  local project_dir = vim.fn.stdpath("data") .. "/myshada/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  if vim.fn.isdirectory(project_dir) == 0 then
    vim.fn.mkdir(project_dir, "p")
  end
  local shadafile = project_dir .. "/" .. vim.fn.sha256(vim.fn.getcwd()):sub(1, 8) .. ".shada"
  vim.opt.shadafile = shadafile
end

-- {/* <TableCell>
--   <p className="order-table-text">{row.deliveredDate}</p>
-- </TableCell> */}
-- Get the current buffer and remove all comments using treesitter
M.remove_comments = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local language_tree = vim.treesitter.get_parser(bufnr)
  local tree = language_tree:parse()[1]
  local query = vim.treesitter.query.parse(
    ---@diagnostic disable-next-line: invisible
    language_tree._lang,
    [[
(comment) @comment
]]
  )

  for _, match in query:iter_matches(tree:root(), bufnr) do
    local comment_node = match[1]

    local parent = comment_node:parent()
    local is_jsx_comment = false

    if parent and parent:type() == "jsx_expression" then
      is_jsx_comment = true
    end
    if not is_jsx_comment then
      local start_row, start_col, end_row, end_col = comment_node:range()
      vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, { "" })
    end
  end

  -- Format buf
  require("conform").format({ bufnr = bufnr })
end
-- What this should do is remove the surrounding tag only and leave whatever is inside of it.
-- A good approach would to read whatever the tag is under cursor copy whatever in inside it and then remove the whole section and repaste the copied text inside.
-- M.surrounding_tags = function()
--   local ts_utils = require("nvim-treesitter.ts_utils")
--   local bufnr = vim.api.nvim_get_current_buf()
--   local language_tree = vim.treesitter.get_parser(bufnr)
--   local node = ts_utils.get_node_at_cursor(bufnr)
--   local tree = language_tree:parse()[1]
-- end

-- when i comment a <div> tag, it should also comment the corresponding </div> tag
return M
