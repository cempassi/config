local api = vim.api

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
