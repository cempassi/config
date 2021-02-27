-- Telescope settings
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    git_icons = {added = "☺", changed = "ƣ", deleted = "ㄐ"},
    mappings = {
	i = {
      ["<C-n>"] = actions.move_selection_next,
      ["<C-p>"] = actions.move_selection_previous,

      ["<leader>q"] = actions.close,

      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,

      ["<CR>"] = actions.select_default + actions.center,
      ["<leader>hs"] = actions.select_horizontal,
      ["<leader>vs"] = actions.select_vertical,
      ["<leader>te"] = actions.select_tab,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,

    },

    n = {
      ["jk"] = actions.close,
      ["<leader>q"] = actions.close,
      ["<CR>"] = actions.select_default + actions.center,
      ["<C-x>"] = actions.select_horizontal,
      ["<C-v>"] = actions.select_vertical,
      ["<C-t>"] = actions.select_tab,

      ["j"] = actions.move_selection_next,
      ["k"] = actions.move_selection_previous,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
      }
    }
  }
}

--require('telescope').load_extension('ghcli')
