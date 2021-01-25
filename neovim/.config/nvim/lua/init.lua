require('telescope_local')

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
-- nvim-dap
--
--local dap = require 'dap'

--dap.adapters.c = {
--      type = 'executable',
--      attach = {
--        pidProperty = "pid",
--        pidSelect = "ask"
--      },
--      command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
--      env = {
--        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
--      },
--      name = "lldb"
--    }
--
--dap.adapters.rust = {
--      type = 'executable',
--      attach = {
--        pidProperty = "pid",
--        pidSelect = "ask"
--      },
--      command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
--      env = {
--        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
--      },
--      name = "lldb"
--    }
--
--dap.configurations.c = {
--      {
--        type = 'c';
--        request = 'launch';
--        name = "ft_ping";
--        program = "./ft_pingdb";
--        args = {"google.fr"}
--      },
--    }
--
--dap.configurations.rust = {
--      {
--        type = 'c';
--        request = 'launch';
--        name = "day05";
--        program = "./target/debug/deps/day05";
--        args = {"google.fr"}
--      },
--    }
--
--vim.cmd [[
--    command! -complete=file -nargs=* DebugC lua require "my_debug".start_c_debugger({<f-args>}, "lldb")
--]]

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

-- Corpus settings
CorpusDirectories = {
      ['~/corpus'] = {
        autoreference = 1,
        autotitle = 1,
        base = './',
        transform = 'local',
      }
}
