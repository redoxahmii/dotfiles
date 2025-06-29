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

M.remove_comments = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
  local is_js_like = filetype == "javascript"
    or filetype == "typescript"
    or filetype == "javascriptreact"
    or filetype == "typescriptreact"
  local is_lua = filetype == "lua"

  local language_tree = vim.treesitter.get_parser(bufnr)
  if not language_tree then
    return
  end
  local syntax_tree = language_tree:parse()[1]

  local query_pattern = "(comment) @comment"

  if filetype == "javascriptreact" or filetype == "typescriptreact" then
    query_pattern = query_pattern .. "\n(jsx_expression (comment) @jsx_comment)"
  end

  local query = vim.treesitter.query.parse(language_tree._lang, query_pattern)

  local changes = {}
  for id, node in query:iter_captures(syntax_tree:root(), bufnr) do
    local name = query.captures[id]
    if name == "comment" or name == "jsx_comment" then
      if is_lua then
        local text = vim.treesitter.get_node_text(node, bufnr)
        if text and text:match("^%-%-%-@") then
          goto continue
        end
      end

      if is_js_like then
        local text = vim.treesitter.get_node_text(node, bufnr)

        if text and (text:match("^/%*%*") or text:match("^%s*/%*%*")) then
          goto continue
        end
      end

      local target_node = name == "jsx_comment" and node:parent() or node
      local start_row, start_col, end_row, end_col = target_node:range()

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
    ::continue::
  end

  for i = #changes, 1, -1 do
    local change = changes[i]
    pcall(vim.api.nvim_buf_set_text, bufnr, change.start_row, change.start_col, change.end_row, change.end_col, { "" })
  end

  require("conform").format({ bufnr = bufnr })
end

return M
