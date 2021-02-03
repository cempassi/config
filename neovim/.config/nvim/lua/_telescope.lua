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

      ["<CR>"] = actions.goto_file_selection_edit + actions.center,
      ["<leader>hs"] = actions.goto_file_selection_split,
      ["<leader>vs"] = actions.goto_file_selection_vsplit,
      ["<leader>te"] = actions.goto_file_selection_tabedit,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,

    },

    n = {
      ["jk"] = actions.close,
      ["<leader>q"] = actions.close,
      ["<CR>"] = actions.goto_file_selection_edit + actions.center,
      ["<C-x>"] = actions.goto_file_selection_split,
      ["<C-v>"] = actions.goto_file_selection_vsplit,
      ["<C-t>"] = actions.goto_file_selection_tabedit,

      ["j"] = actions.move_selection_next,
      ["k"] = actions.move_selection_previous,

      ["<C-u>"] = actions.preview_scrolling_up,
      ["<C-d>"] = actions.preview_scrolling_down,
      }
    }
  }
}

--require('telescope').load_extension('ghcli')
