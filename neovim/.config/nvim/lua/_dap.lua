-- In a file lua/my_debug.lua
--
local M = {}
local last_gdb_config
local dap = require 'dap'

dap.adapters.c = {
      type = 'executable',
      attach = {
        pidProperty = "pid",
        pidSelect = "ask"
      },
      command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
      env = {
        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
      },
      name = "lldb"
    }

dap.adapters.rust = {
      type = 'executable',
      attach = {
        pidProperty = "pid",
        pidSelect = "ask"
      },
      command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
      env = {
        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
      },
      name = "lldb"
    }

dap.configurations.c = {
      {
        type = 'c';
        request = 'launch';
        name = "ft_ping";
        program = "./ft_pingdb";
        args = {"google.fr"}
      },
    }

dap.configurations.rust = {
      {
        type = 'c';
        request = 'launch';
        name = "day05";
        program = "./target/debug/deps/day05";
        args = {"google.fr"}
      },
    }

vim.cmd [[
    command! -complete=file -nargs=* DebugC lua require "my_debug".start_c_debugger({<f-args>}, "lldb")
]]

M.start_c_debugger = function(args, mi_mode, mi_debugger_path)
    local dap = require "dap"
    if args and #args > 0 then
        last_gdb_config = {
            type = "c",
            name = args[1],
            request = "launch",
            program = table.remove(args, 1),
            args = args,
            cwd = vim.fn.getcwd(),
            env = {}, -- environment variables are set via `ENV_VAR_NAME=value` pairs
            externalConsole = true,
            MIMode = mi_mode or "gdb",
            MIDebuggerPath = mi_debugger_path
          }
    end

    if not last_gdb_config then
        print('No binary to debug set! Use ":DebugC <binary> <args>" or ":DebugRust <binary> <args>"')
        return
    end

    dap.run(last_gdb_config)
    dap.repl.open()
end

return M
