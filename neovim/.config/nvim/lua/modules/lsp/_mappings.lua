local k = require("astronauta.keymap")
local nnoremap = k.nnoremap
local inoremap = k.inoremap

local M = {}

-- local provider = require"lspsaga.provider"
local hover = require("lspsaga.hover")
local codeaction = require("lspsaga.codeaction")
local sig_help = require("lspsaga.signaturehelp")
local rename = require("lspsaga.rename")
local diagnostic = require("lspsaga.diagnostic")

M.lsp_mappings = function()
  inoremap{'<leader>cs', sig_help.signature_help, { silent = true }}
  nnoremap{'K', hover.render_hover_doc, { silent = true }}
  nnoremap{'<leader>ca', codeaction.code_action, { silent = true }}
  nnoremap{'<leader>ci', require("lspsaga.provider").preview_definition, { silent = true }}
  nnoremap{'<leader>cd', vim.lsp.buf.definition, { silent = true }}
  nnoremap{'<leader>c<leader>', require("telescope.builtin").lsp_references, { silent = true }}
  nnoremap{'<leader>cn', rename.rename, { silent = true }}
  nnoremap{'<leader>cr', require("lspsaga.provider").lsp_finder, { silent = true }}
  nnoremap{'<leader>ce', diagnostic.show_line_diagnostics, { silent = true }}
  nnoremap{ '<leader>ep', diagnostic.lsp_jump_diagnostic_prev, {silent = true}}
  nnoremap{ '<leader>en', diagnostic.lsp_jump_diagnostic_next, {silent = true}}
  nnoremap{
    '<C-j>',
    function()
      return hover.has_saga_hover() and hover.scroll_in_hover(-1)
    end,
    { silent = true },
  }
  nnoremap{
    '<C-k>',
    function()
      return hover.has_saga_hover() and hover.scroll_in_hover(1)
    end,
    { silent = true },
  }
end

return M
