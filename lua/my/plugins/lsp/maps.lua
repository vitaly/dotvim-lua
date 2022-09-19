noremap('<plug>Goto(declaration)', '<cmd>lua vim.lsp.buf.declaration()<cr>')
noremap('<plug>Goto(definitions)', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
noremap('<plug>Hover()', '<cmd>lua vim.lsp.buf.hover()<CR>')
noremap('<plug>Goto(implementations)', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>')
noremap('<plug>Help(signature)', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
noremap('<plug>Goto(type)', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

noremap('<plug>Refactor(rename)', '<cmd>lua vim.lsp.buf.rename()<CR>')
-- noremap('<plug>Refactor(rename)', '<cmd>lua require("lspsaga.rename").rename()<CR>')

noremap('<plug>Goto(references)', '<cmd>lua require("telescope.builtin").lsp_references()<CR>')
noremap('<plug>Code(actions)', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>')
noremap('<plug>Goto(first)', '<cmd>normal gg<cr><cmd>lua vim.diagnostic.goto_next()<cr>')
noremap('<plug>Goto(next)', '<cmd>lua vim.diagnostic.goto_next()<cr>')
noremap('<plug>Goto(previous)', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

noremap('<plug>LSP(Info)', '<cmd>LspInfo<cr>')
noremap('<plug>LSP(Installed)', '<cmd>LspInstallInfo<cr>')
noremap('<plug>LSP(Start)', '<cmd>LspStart<cr>')
noremap('<plug>LSP(Stop)', '<cmd>LspStop<cr>')
noremap('<plug>LSP(Restart)', '<cmd>LspRestart<cr>')

noremap('<plug>LSP(Refresh-Trouble)', '<cmd>TroubleRefresh<cr>')
noremap('<plug>LSP(Document-Trouble)', '<cmd>TroubleToggle document_diagnostics<cr>')
noremap('<plug>LSP(Workspace-Trouble)', '<cmd>TroubleToggle workspace_diagnostics<cr>')
noremap('<plug>LSP(Definitions-Trouble)', '<cmd>TroubleToggle lsp_definitions<cr>')
noremap('<plug>LSP(References-Trouble)', '<cmd>TroubleToggle lsp_references<cr>')

noremap('<plug>LSP(Debug-Log)', function()
  vim.lsp.set_log_level 'trace'
  require('vim.lsp.log').set_format_func(vim.inspect)
  vim.cmd('e' .. vim.lsp.get_log_path())
end)

require('which-key').register {
  ['<leader>al'] = {
    name = 'LSP',

    t = {
      name = 'Trouble',

      d = { '<plug>LSP(Document-Trouble)', 'Document diagnostics' },
      w = { '<plug>LSP(Workspace-Trouble)', 'Workspace diagnostics' },
      l = { '<plug>LSP(Definitions-Trouble)', 'LSP definitions' },
      r = { '<plug>LSP(References-Trouble)', 'LSP references' },
      R = { '<plug>LSP(Refresh-Trouble)', 'Refresh' },
    },
  },
}

nmap('<leader>ali', '<plug>LSP(Info)')
nmap('<leader>alI', '<plug>LSP(Installed)')
nmap('<leader>als', '<plug>LSP(Start)')
nmap('<leader>alS', '<plug>LSP(Stop)')
nmap('<leader>alR', '<plug>LSP(Restart)')
nmap('<leader>alD', '<plug>LSP(Debug-Log)')
