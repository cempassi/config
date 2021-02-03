-- Tree-sitter configuration

require'nvim-treesitter.configs'.setup {
		ensure_installed = {maintained}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		highlight = {
			enable = true,              -- false will disable the whole extension
			use_languagetree = false, -- Use this to enable language injection (this is very unstable)
			disable = {},  -- list of language that will be disabled
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
