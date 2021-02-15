vim.cmd[[packadd nvim-lspconfig]]
vim.cmd[[packadd lspsaga.nvim]]

local api = vim.api
local lspconfig = require("lspconfig")
local mappings = require("modules.lsp._mappings")

require("modules.lsp._diagnostic") -- diagnostic stuff

require"lspsaga".init_lsp_saga({
  border_style = 1,
}) -- initialise lspsaga UI

local custom_on_attach = function(client, bufnr)
  mappings.lsp_mappings()

  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end

  api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local custom_on_init = function()
  print("Language Server Protocol started!")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.bashls.setup{
  on_attach = custom_on_attach
}

lspconfig.yamlls.setup{
  on_attach = custom_on_attach,
  settings = {
    yaml = {
      schemaStore = {
        enable = true
      }
    }
  }
}

lspconfig.vimls.setup{
  on_attach = custom_on_attach
}

lspconfig.tsserver.setup{
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

lspconfig.jdtls.setup{
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

lspconfig.html.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities
}

lspconfig.cssls.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities
}

lspconfig.rust_analyzer.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities,

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

lspconfig.terraformls.setup{
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities
}

lspconfig.clangd.setup({
  on_attach = custom_on_attach,
  on_init = custom_on_init,
  capabilities = capabilities,
  cmd = {
    "/usr/local/Cellar/llvm/11.0.1/bin/clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    --"--header-insertion=iwyu",
  },
  init_options = {
    clangdFileStatus = true
  },
})

local sumneko_root = os.getenv("HOME") .. "/Applications/lua-language-server"
lspconfig.sumneko_lua.setup{
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
