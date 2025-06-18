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
  local language_tree = vim.treesitter.get_parser(bufnr)
  local syntax_tree = language_tree:parse()[1]
  local query = vim.treesitter.query.parse(
    language_tree._lang,
    [[
    (comment) @comment
    (jsx_expression
      (comment) @jsx_comment)
    ]]
  )

  -- Collect all text changes first
  local changes = {}
  for id, node in query:iter_captures(syntax_tree:root(), bufnr) do
    local name = query.captures[id]
    if name == "comment" or name == "jsx_comment" then
      local target_node = name == "jsx_comment" and node:parent() or node
      local start_row, start_col, end_row, end_col = target_node:range()

      -- Validate ranges
      local line = vim.api.nvim_buf_get_lines(bufnr, start_row, start_row + 1, true)[1] or ""
      start_col = math.max(0, math.min(start_col, #line))
      end_col = math.max(0, math.min(end_col, #line))

      if start_row == end_row and start_col <= end_col then
        table.insert(changes, {
          start_row = start_row,
          start_col = start_col,
          end_row = end_row,
          end_col = end_col,
        })
      end
    end
  end

  -- Apply changes in reverse order
  for i = #changes, 1, -1 do
    local change = changes[i]
    pcall(vim.api.nvim_buf_set_text, bufnr, change.start_row, change.start_col, change.end_row, change.end_col, { "" })
  end

  require("conform").format({ bufnr = bufnr })
end
return M
