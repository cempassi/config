local api = vim.api

-- CHADTree settings
api.nvim_set_var("chadtree_settings",{
		open_left = true,
		keymap = {
			quit = "_",
			smaller = "(",
			bigger = ")",
			change_focus = ">",
			change_focus_up = "<",
			refocus = "="
		}
	}
)

-- Telescope settings
local actions = require('telescope.actions')

require('telescope').setup {
  defaults = {
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

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
		ensure_installed = {lua}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		highlight = {
			enable = true,              -- false will disable the whole extension
			use_languagetree = false, -- Use this to enable language injection (this is very unstable)
			disable = { "c", "rust" },  -- list of language that will be disabled
		},
		indent = {
			enable = true
		},
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false -- Whether the query persists across vim sessions
		}
	}

CorpusDirectories = {
      ['~/corpus'] = {
        autoreference = 1,
        autotitle = 1,
        base = './',
        transform = 'local',
      }
}
