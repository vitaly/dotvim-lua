-- lua/layers/ide/lsp/config/style.lua

local function lsp_style()
  -- DiagnosticSignXXX highlights are linked to DiagnosticXXX
  -- problem with DiagnosticXXX is that their background differs from that of SignColumn
  -- so we fix it by extracting bg color from SignColumn ad updating DiagnosticXXX with it
  local signs = { Error = '✖', Warn = '', Hint = '', Info = '' }
  local sign_bg = vim.fn.synIDattr(vim.fn.hlID 'SignColumn', 'bg')
  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.cmd('hi Diagnostic' .. type .. ' guibg=' .. sign_bg)
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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

return {
  setup = function()
    require('my.tools').subscribe('lsp_style', 'ColorScheme', lsp_style)
    lsp_style()
    -- set_window_opts()
    set_diagnostic_opts()
  end,
}
