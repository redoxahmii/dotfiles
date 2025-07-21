-- require("relative-motions"):setup({ show_numbers = "relative", show_motion = true })

require("bookmarks"):setup({
	persist = "all",
	last_directory = { enable = true, persist = true },
	file_pick_mode = "hover",
})

require("no-status"):setup()
