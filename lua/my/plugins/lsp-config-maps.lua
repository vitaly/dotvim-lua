noremap('<plug>Goto(declaration)', '<cmd>lua vim.lsp.buf.declaration()<cr>')
noremap('<plug>Goto(definitions)', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
noremap('<plug>Hover()', '<cmd>lua vim.lsp.buf.hover()<CR>')
noremap('<plug>Goto(implementations)', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>')
noremap('<plug>Help(signature)', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
noremap('<plug>Goto(type)', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

-- noremap('<plug>Refactor(rename)',      '<cmd>lua vim.lsp.buf.rename()<CR>')
noremap('<plug>Refactor(rename)', '<cmd>lua require("lspsaga.rename").rename()<CR>')

noremap('<plug>Goto(references)', '<cmd>lua require("telescope.builtin").lsp_references()<CR>')
noremap('<plug>Code(actions)', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>')
noremap('<plug>Goto(first)', '<cmd>normal gg<cr><cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
noremap('<plug>Goto(next)', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
noremap('<plug>Goto(previous)', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')

noremap('<plug>LSP(Info)', '<cmd>LspInfo<cr>')
noremap('<plug>LSP(Installed)', '<cmd>LspInstallInfo<cr>')
noremap('<plug>LSP(Start)', '<cmd>LspStart<cr>')
noremap('<plug>LSP(Stop)', '<cmd>LspStop<cr>')
noremap('<plug>LSP(Restart)', '<cmd>LspRestart<cr>')
noremap('<plug>LSP(Trouble)', '<cmd>LspTroubleToggle<cr>')
noremap('<plug>LSP(Workspace-Trouble)', '<cmd>LspTroubleWorkspaceToggle<cr>')
noremap('<plug>LSP(Refresh-Trouble)', '<cmd>LspTroubleRefresh<cr>')

nmap('<leader>ali', '<plug>LSP(Info)')
nmap('<leader>alI', '<plug>LSP(Installed)')
nmap('<leader>als', '<plug>LSP(Start)')
nmap('<leader>alS', '<plug>LSP(Stop)')
nmap('<leader>alR', '<plug>LSP(Restart)')

nmap('<leader>alt', '<plug>LSP(Trouble)')
nmap('<leader>alw', '<plug>LSP(Workspace-Trouble)')
nmap('<leader>alr', '<plug>LSP(Refresh-Trouble)')
vim.cmd [[
command! Autoformat     call luaeval('vim.lsp.buf.formatting()')      | retab
command! AutoformatSync call luaeval('vim.lsp.buf.formatting_sync()') | retab
]]

-- buf_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
-- buf_keymap(0, 'n', 'gi', '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', keymap_opts)
-- buf_keymap(0, 'n', 'gS', '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
-- buf_keymap(0, 'n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', keymap_opts)
-- buf_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
-- buf_keymap(0, 'n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', keymap_opts)
-- buf_keymap(0, 'n', 'gA', '<cmd>lua require"telescope.builtin".lsp_code_actions()<CR>', keymap_opts)
-- buf_keymap(0, 'n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', keymap_opts)
-- buf_keymap(0, 'n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', keymap_opts)

-- buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
-- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
-- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
-- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
-- buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
-- buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
-- buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
-- buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
-- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- buf_set_keymap("v", "<space>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
