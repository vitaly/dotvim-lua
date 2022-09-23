return {
  setup = function()
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
    vim.cmd [[
      hi DiagnosticHint guifg=yellow
    ]]

    -- set double border by default
    local win = require 'lspconfig.ui.windows'
    local _default_opts = win.default_opts

    win.default_opts = function(options)
      local opts = _default_opts(options)
      opts.border = 'double'
      return opts
    end
  end
}
