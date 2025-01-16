return {
	{
		"kawre/leetcode.nvim",
		lazy = true,
		branch = "dev",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			arg = "leet",
			lang = "javascript",
			logging = false,
		},
	},
	-- {
	--   "stevearc/conform.nvim",
	--   opts = {
	--     formatters = {
	--       prettier = {
	--         prepend_args = { "--single-quote" },
	--       },
	--     },
	--   },
	-- },
}
