local remove_comments = function()
  local buf = vim.api.nvim_get_current_buf()
  local filetype = vim.bo.filetype
  local language = vim.treesitter.language.get_lang(filetype)
  if not language then
    return
  end

  local language_tree = vim.treesitter.get_parser(buf)
  local tree = language_tree:parse()[1]
  local query = vim.treesitter.query.parse(language, "(comment_content) @comment")

  for _, match in query:iter_matches(tree:root(), buf, 0, -1, { all = true }) do
    for _, nodes in ipairs(match) do
      for _, node in ipairs(nodes) do
        local start_row, start_col, end_row, end_col = node:range()
        local contained_node = language_tree:named_node_for_range(
          { end_row, end_col - 1, end_row, end_col },
          { ignore_injections = false }
        )
        print(contained_node:type())
        if contained_node:type() == "comment_content" then
          vim.api.nvim_buf_set_text(buf, start_row, start_col - 2, end_row, end_col, { "" })
        end
      end
    end
  end
end
remove_comments()
-- algo

---@class algo
