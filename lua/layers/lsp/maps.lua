
  -- -- noremap('<plug>Refactor(rename)', '<cmd>lua require("lspsaga.rename").rename()<CR>')

-- require('which-key').register {
--   ['<leader>al'] = {
--     name = 'LSP',

--     t = {
--       name = 'Trouble',

--       d = { '<plug>LSP(Document-Trouble)', 'Document diagnostics' },
--       w = { '<plug>LSP(Workspace-Trouble)', 'Workspace diagnostics' },
--       l = { '<plug>LSP(Definitions-Trouble)', 'LSP definitions' },
--       r = { '<plug>LSP(References-Trouble)', 'LSP references' },
--       R = { '<plug>LSP(Refresh-Trouble)', 'Refresh' },
--     },
--   },
-- }

local m = {
  lsp_info  = '<cmd>LspInfo<cr>',
  lsp_log = '<cmd>LspLog<cr>',
  lsp_stop = '<cmd>LspStop<cr>',
  lsp_restart = '<cmd>LspRestart<cr>',
  lsp_debug_log = function ()
    vim.lsp.set_log_level 'trace'
    require('vim.lsp.log').set_format_func(vim.inspect)
    vim.cmd[[LspLog]]
  end,

  goto_definition      = vim.lsp.buf.definition,
  goto_declaration     = vim.lsp.buf.declaration,
  goto_implementation  = vim.lsp.buf.implementation,
  goto_type_definition = vim.lsp.buf.type_definition,
  goto_references      = vim.lsp.buf.references,

  help_signature       = vim.lsp.buf.signature_help,

  add_workspace_folder = vim.lsp.buf.add_workspace_folder,
  remove_workspace_folder = vim.lsp.buf.remove_workspace_folder,
  list_workspace_folders = function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end,

  list_definitions     = require("telescope.builtin").lsp_definitions,
  list_implementations = require("telescope.builtin").lsp_implementations,

  hover                = vim.lsp.buf.hover,

  refactor_rename      = vim.lsp.buf.rename,

  list_references      = require("telescope.builtin").lsp_references,
  code_actions         = require("telescope.builtin").lsp_code_actions,

  first_diagnostic     = '<cmd>normal gg<cr><cmd>lua vim.diagnostic.goto_next()<cr>',
  next_diagnostic      = vim.diagnostic.goto_next,
  prev_diagnostic      = vim.diagnostic.goto_prev,


  -- LSP(Refresh-Trouble)',     '<cmd>TroubleRefresh<cr>')
  -- LSP(Document-Trouble)',    '<cmd>TroubleToggle document_diagnostics<cr>')
  -- LSP(Workspace-Trouble)',   '<cmd>TroubleToggle workspace_diagnostics<cr>')
  -- LSP(Definitions-Trouble)', '<cmd>TroubleToggle lsp_definitions<cr>')
  -- LSP(References-Trouble)',  '<cmd>TroubleToggle lsp_references<cr>')

}


require('which-key').register({
  ['<leader>al'] = {
    name = 'LSP',

    i = { m.lsp_info, 'Info' },
    l = { m.lsp_log, 'Log' },
    D = { m.lsp_debug_log, 'Debug Log' },
    S = { m.lsp_stop, 'Stop' },
    R = { m.lsp_restart, 'Restart' },
  }
})


return m
