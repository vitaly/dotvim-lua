-- lua/layers/ide/lsp/config/style.lua

local M = {}

function M.update()
  local signs = { Error = '✖', Warn = '', Hint = '', Info = '' }
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })

    -- DiagnosticSignXXX highlights are linked to DiagnosticXXX
    -- problem with DiagnosticXXX is that their background differs from that of SignColumn
    -- so we fix it by overwriting bg
    _my.ui.sign_hi('Diagnostic' .. type)
  end

  -- and while we at it, I also want the hint to be yellow
  --
  -- LspReferenceXXX is used to highlight words under cursor
  -- this is required for vim.lsp.buf.document_highlight() to work
  -- which is setup in on_attach.lua
  vim.cmd [[
    hi DiagnosticHint guifg=yellow

    hi LspReferenceText cterm=inverse gui=inverse
    hi LspReferenceRead cterm=inverse gui=inverse
    hi LspReferenceWrite cterm=inverse gui=inverse
  ]]
end

-- TODO: check if needed
-- local function set_window_opts()
--   -- set double border by default
--   local win = require 'lspconfig.ui.windows'
--   local _default_opts = win.default_opts -- FIXME: store the defaults in a global variable

--   win.default_opts = function(options)
--     local opts = _default_opts(options)
--     opts.border = 'double'
--     return opts
--   end
-- end

local function set_diagnostic_opts()
  vim.diagnostic.config {
    virtual_text = false,
    -- virtual_text = { prefix = '', spacing = 5 },
    signs = true,
    underline = true,
    update_in_insert = false,
  }
end

function M.setup()
  _my.au.on_colorscheme('lsp.style', M.update)
  -- set_window_opts()
  set_diagnostic_opts()
end

return M
