vim.cmd[[packadd nvim-lspconfig]]
vim.cmd[[packadd lspsaga.nvim]]

local nvim_lsp = require("lspconfig")
local mappings = require("modules.lsp._mappings")

require("modules.lsp._diagnostic") -- diagnostic stuff

require"lspsaga".init_lsp_saga({
  border_style = 1,
}) -- initialise lspsaga UI

local custom_on_attach = function(client)
  mappings.lsp_mappings()

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

end

local custom_on_init = function()
  print("Language Server Protocol started!")
end

local custom_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true;

  return capabilities
end

nvim_lsp.bashls.setup{
  on_attach = custom_on_attach
}

nvim_lsp.yamlls.setup{
  on_attach = custom_on_attach,
  settings = {
    yaml = {
      schemaStore = {
        enable = true
      }
    }
  }
}

nvim_lsp.vimls.setup{
  on_attach = custom_on_attach
}

nvim_lsp.tsserver.setup{
  filetypes = { "javascript", "typescript", "typescriptreact" },
  on_attach = function(client)
    mappings.lsp_mappings()
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
  end,
  on_init = custom_on_init,
  root_dir = vim.loop.cwd,
}

nvim_lsp.jdtls.setup{
  cmd = {"jdtls"},
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  settings = {
    java = {
      errors = {
        incompleteClasspath = {
          severity = "ignore"
        }
      }
    }
  }
}

nvim_lsp.html.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = custom_capabilities()
}

nvim_lsp.cssls.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = custom_capabilities()
}

nvim_lsp.rust_analyzer.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = custom_capabilities(),

settings = {
    ["rust-analyzer"] = {
      assist = {
        importMergeBehaviour = "full",
      },

      callInfo = {
        full = true,
      };

      cargo = {
        loadOutDirsFromCheck = true
      },

      checkOnSave = {
        allFeatures = true,
      },

      procMacro = {
        enable = true,
      },
    },
  },
}

nvim_lsp.terraformls.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = custom_capabilities()
}

nvim_lsp.clangd.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init
}

local sumneko_root = os.getenv("HOME") .. "/Applications/lua-language-server"
nvim_lsp.sumneko_lua.setup{
  cmd = {
    sumneko_root
    .. "/bin/macOS/lua-language-server", "-E",
    sumneko_root .. "/main.lua"
  },
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";"), },
      diagnostics = {
        enable = true,
        globals = {
          "vim", "describe", "it", "before_each", "after_each",
          "awesome", "theme", "client", "P", "use"
        },
        workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    }
  }
  }
}
