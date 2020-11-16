local api = vim.api

api.nvim_set_var("chadtree_settings", {open_left = true, keymap = {
	quit = "-",
	smaller = "_",
	change_focus = ">",
	change_focus_up = "<",
	refocus = "="
}})

