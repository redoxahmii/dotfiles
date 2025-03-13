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

-- Only run jsx part if in jsx or tsx ifl
M.remove_comments = function()
  local bufnr = vim.api.nvim_get_current_buf()
  -- local ft = vim.bo.filetype
  -- if ft ~= "javascript" and ft ~= "typescript" then
  --   return
  -- end
  local language_tree = vim.treesitter.get_parser(bufnr)
  local tree = language_tree:parse()[1]
  local query = vim.treesitter.query.parse(
    ---@diagnostic disable-next-line: invisible
    language_tree._lang,
    [[
(comment) @comment
]]
  )

  --   local jsx_comment_query = vim.treesitter.query.parse(
  --     ---@diagnostic disable-next-line: invisible
  --     language_tree._lang,
  --     [[
  -- (jsx_expression
  --   (comment) @comment
  --   )
  -- ]]
  --   )
  --
  -- Remove regular comments
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

  -- -- Remove JSX comments and their wrapping jsx_expression
  -- for _, match in jsx_comment_query:iter_matches(tree:root(), bufnr) do
  --   local comment_node = match[1]
  --   local parent = comment_node:parent()
  --
  --   if parent and parent:type() == "jsx_expression" then
  --     -- Remove the entire jsx_expression node
  --     local start_row, start_col, end_row, end_col = parent:range()
  --     vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, { "" })
  --   end
  -- end

  -- Format buf
  require("conform").format({ bufnr = bufnr })
end

return M
