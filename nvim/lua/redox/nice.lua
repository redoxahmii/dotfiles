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

M.open_plugin_github = function()
  local current_line = vim.api.nvim_get_current_line()

  local plugin_name = current_line:match('"([^"]-/[^"]-%.nvim)"')
    or current_line:match("'([^']-/[^']-%.nvim)'")
    or current_line:match('"([^"]-/[^"]-[^"]-)"')
    or current_line:match("'([^']-/[^']-[^']-)'")
    or current_line:match("(%S+/%S+%.nvim)")
    or current_line:match("(%S+/%S+)")

  if plugin_name then
    plugin_name = plugin_name:gsub("^['\"]+", ""):gsub("['\"]+$", "")

    local github_url = "https://www.github.com/" .. plugin_name

    vim.fn.jobstart({ "xdg-open", github_url }, { detach = true })
  else
    print("No plugin name matching pattern 'user/repo' found on current line")
  end
end

M.fix_unescaped_entities = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr)

  local eslint_diagnostics = {}
  for _, diagnostic in ipairs(diagnostics) do
    if
      (diagnostic.source == "eslint" or diagnostic.source == "ESLint" or diagnostic.source:lower():match("eslint"))
      and diagnostic.message:match("can be escaped with")
    then
      table.insert(eslint_diagnostics, diagnostic)
    end
  end

  local diagnostics_by_line = {}
  for _, diagnostic in ipairs(eslint_diagnostics) do
    local row = diagnostic.lnum
    if not diagnostics_by_line[row] then
      diagnostics_by_line[row] = {}
    end
    table.insert(diagnostics_by_line[row], diagnostic)
  end

  for row, line_diagnostics in pairs(diagnostics_by_line) do
    local line_content = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]
    if line_content then
      table.sort(line_diagnostics, function(a, b)
        return a.col > b.col
      end)

      local new_line = line_content
      local offset = 0
      local last_diagnostic_processed = nil

      for _, diagnostic in ipairs(line_diagnostics) do
        local col = diagnostic.col
        local adjusted_col = col + offset

        if adjusted_col + 1 <= #new_line then
          local char_at_pos = new_line:sub(adjusted_col + 1, adjusted_col + 1)

          if char_at_pos == "'" then
            new_line = new_line:sub(1, adjusted_col) .. "&apos;" .. new_line:sub(adjusted_col + 2)
            offset = offset + 5
            last_diagnostic_processed = diagnostic
          elseif char_at_pos == '"' then
            new_line = new_line:sub(1, adjusted_col) .. "&quot;" .. new_line:sub(adjusted_col + 2)
            offset = offset + 5
            last_diagnostic_processed = diagnostic
          end
        end
      end

      vim.api.nvim_buf_set_lines(bufnr, row, row + 1, false, { new_line })

      if last_diagnostic_processed then
        local last_col = last_diagnostic_processed.col + offset
        vim.api.nvim_win_set_cursor(0, { row + 1, last_col })
      end
    end
  end
end
-- ├╴  The class `max-w-[540px]` can be written as `max-w-135`  (suggestCanonicalClasses) [159, 34]

M.fix_suggested_canonical_classes = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr)

  local tailwind_diagnostics = {}
  for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.message and diagnostic.message:match("can be written as") then
      table.insert(tailwind_diagnostics, diagnostic)
    end
  end

  local diagnostics_by_line = {}
  for _, diagnostic in ipairs(tailwind_diagnostics) do
    local row = diagnostic.lnum
    if not diagnostics_by_line[row] then
      diagnostics_by_line[row] = {}
    end
    table.insert(diagnostics_by_line[row], diagnostic)
  end

  for row, line_diagnostics in pairs(diagnostics_by_line) do
    local line_content = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]
    if line_content then
      table.sort(line_diagnostics, function(a, b)
        return a.col > b.col
      end)

      local new_line = line_content
      local offset = 0
      local last_diagnostic_processed = nil

      for _, diagnostic in ipairs(line_diagnostics) do
        local old_class, new_class = diagnostic.message:match("The class `([^`]+)` can be written as `([^`]+)`")
        if old_class and new_class then
          local search_start = math.max(1, diagnostic.col + 1 + offset)
          local idx = new_line:find(old_class, search_start, true)
          if idx then
            new_line = new_line:sub(1, idx - 1) .. new_class .. new_line:sub(idx + #old_class)
            offset = offset + #new_class - #old_class
            last_diagnostic_processed = diagnostic
          end
        end
      end

      vim.api.nvim_buf_set_lines(bufnr, row, row + 1, false, { new_line })

      if last_diagnostic_processed then
        vim.api.nvim_win_set_cursor(0, { row + 1, last_diagnostic_processed.col + offset })
      end
    end
  end
end

M.open_git_changes = function()
  local cwd = vim.fn.getcwd()

  local git_dir = vim.fn.systemlist("git -C " .. cwd .. " rev-parse --git-dir")[1]
  if vim.v.shell_error ~= 0 then
    print("Not in a git repository")
    return
  end

  local untracked_files = vim.fn.systemlist("git -C " .. cwd .. " ls-files --others --exclude-standard")

  local modified_files = vim.fn.systemlist("git -C " .. cwd .. " diff --name-only")
  local staged_files = vim.fn.systemlist("git -C " .. cwd .. " diff --cached --name-only")

  local all_files = {}
  local seen = {}

  for _, file in ipairs(untracked_files) do
    if file ~= "" and not seen[file] then
      table.insert(all_files, file)
      seen[file] = true
    end
  end

  for _, file in ipairs(modified_files) do
    if file ~= "" and not seen[file] then
      table.insert(all_files, file)
      seen[file] = true
    end
  end

  for _, file in ipairs(staged_files) do
    if file ~= "" and not seen[file] then
      table.insert(all_files, file)
      seen[file] = true
    end
  end

  if #all_files == 0 then
    print("No modified or untracked files found")
    return
  end

  for _, file in ipairs(all_files) do
    local filepath = cwd .. "/" .. file
    vim.cmd("badd " .. vim.fn.fnameescape(filepath))
  end

  local dashboard_buffers = {}
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
    if buf_ft == "snacks_dashboard" then
      table.insert(dashboard_buffers, bufnr)
    end
  end

  for _, bufnr in ipairs(dashboard_buffers) do
    pcall(vim.api.nvim_buf_delete, bufnr, { force = false })
  end

  print("Opened " .. #all_files .. " file(s) in buffers")
end

return M
