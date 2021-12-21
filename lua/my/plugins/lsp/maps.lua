noremap('<plug>Goto(declaration)', '<cmd>lua vim.lsp.buf.declaration()<cr>')
noremap('<plug>Goto(definitions)', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
noremap('<plug>Hover()', '<cmd>lua vim.lsp.buf.hover()<CR>')
noremap('<plug>Goto(implementations)', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>')
noremap('<plug>Help(signature)', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
noremap('<plug>Goto(type)', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

-- noremap('<plug>Refactor(rename)', '<cmd>lua vim.lsp.buf.rename()<CR>')
noremap('<plug>Refactor(rename)', '<cmd>lua require("lspsaga.rename").rename()<CR>')

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
noremap('<plug>LSP(Trouble)', '<cmd>LspTroubleToggle<cr>')
noremap('<plug>LSP(Workspace-Trouble)', '<cmd>LspTroubleWorkspaceToggle<cr>')
noremap('<plug>LSP(Refresh-Trouble)', '<cmd>LspTroubleRefresh<cr>')
noremap('<plug>LSP(Debug-Log)', function()
  vim.lsp.set_log_level 'trace'
  require('vim.lsp.log').set_format_func(vim.inspect)
  vim.cmd('e' .. vim.lsp.get_log_path())
end)

require('which-key').register { ['<leader>al'] = { name = 'LSP' } }

nmap('<leader>ali', '<plug>LSP(Info)')
nmap('<leader>alI', '<plug>LSP(Installed)')
nmap('<leader>als', '<plug>LSP(Start)')
nmap('<leader>alS', '<plug>LSP(Stop)')
nmap('<leader>alR', '<plug>LSP(Restart)')
nmap('<leader>alD', '<plug>LSP(Debug-Log)')

nmap('<leader>alt', '<plug>LSP(Trouble)')
nmap('<leader>alw', '<plug>LSP(Workspace-Trouble)')
nmap('<leader>alr', '<plug>LSP(Refresh-Trouble)')
vim.cmd [[
  command! LspFormat     call luaeval('vim.lsp.buf.formatting()')
  command! LspFormatSync call luaeval('vim.lsp.buf.formatting_sync()')
]]
