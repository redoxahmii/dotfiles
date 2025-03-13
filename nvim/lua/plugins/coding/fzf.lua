return {
  {
    "ibhagwan/fzf-lua",
    opts = {
      oldfiles = {
        -- load current dir buf
        include_current_session = true,
      },
      previewers = {
        builtin = {
          -- disable preview for large files
          syntax_limit_b = 1024 * 100,
        },
      },
    },
  },
}
