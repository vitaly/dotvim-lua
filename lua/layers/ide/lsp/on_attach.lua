---------------------------------------------------------------------------
-- Setup local buffer maps for LSP
local function setup_lsp_keymaps()
  local m = require 'layers.ide.lsp.maps'

  require('which-key').register({

    ['<localleader>'] = {

      r = {
        name = 'Refactor',
        r = { m.refactor_rename, 'Refactor(Rename)' },
      },

      a = { m.code_action, 'Code Action' },

      ['1'] = { m.first_diagnostic, 'First Problem' },
      n = { m.next_diagnostic, 'Next Problem' },
      p = { m.prev_diagnostic, 'Prev Problem' },

    },

    gd = { m.list_definitions, 'Definition'},
    gD = { m.goto_declaration, 'Declaration'},
    gr = { m.list_references, 'References'},
    -- gt = { m.goto_type_definition, 'Type'},

    K = { m.hover, 'Hover' },
  }, {
    buffer = 0,
  })

  nmap({ 'buffer' }, '<C-LeftMouse>', '<LeftMouse><cmd>lua vim.lsp.buf.definition()<cr>')
  nmap({ 'buffer' }, '<A-LeftMouse>', '<LeftMouse><cmd>lua vim.lsp.buf.hover()<cr>')
end

local function setup_highlight(client)
  if client.server_capabilities.documentHighlightProvider ~= true then
    return
  end

  vim.cmd[[
    augroup lsp_highlight
      autocmd!
      autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]]
end

---------------------------------------------------------------------------
-- ON_ATTACH
local function on_attach(client, _)
  setup_lsp_keymaps()
  setup_highlight(client)
end

return on_attach


---------------------------------------------------------------------------
-- TODO: cleanup
---------------------------------------------------------------------------
  -- ['<leader>'] = {

  --   l = {
  --     name = 'LSP',

  --     i = { m.lsp_info, 'Info' },
  --     l = { m.lsp_log, 'Log' },
  --     s = { m.lsp_stop, 'Stop' },
  --     r = { m.lsp_restart, 'Restart' },
  --     d = { m.lsp_debug_log, 'Debug Log' },

  --     t = {
  --       name = 'Trouble',

  --       d = { m.document_diagnostics, 'Document diagnostics' },
  --       w = { m.workspace_diagnostics, 'Workspace diagnostics' },
  --       l = { m.lsp_definitions, 'LSP definitions' },
  --       r = { m.lsp_references, 'LSP references' },
  --       R = { m.refresh_trouble, 'Refresh' },
  --     },

  --   },

  -- },

-- return function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end

--   -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   -- Enable completion triggered by <c-x><c-o>
--   buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

--   require('folding').on_attach()
--   -- require('lsp-status').on_attach(client)

-- end

-- -- buf_keymap(0, 'n', 'gi', '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', keymap_opts)
-- -- buf_keymap(0, 'n', 'gS', '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
-- -- buf_keymap(0, 'n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', keymap_opts)
-- -- buf_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
-- -- buf_keymap(0, 'n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', keymap_opts)
-- -- buf_keymap(0, 'n', 'gA', '<cmd>lua require"telescope.builtin".lsp_code_actions()<CR>', keymap_opts)
-- -- buf_keymap(0, 'n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', keymap_opts)
-- -- buf_keymap(0, 'n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', keymap_opts)
--
-- -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
-- -- buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- -- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
-- -- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
-- -- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
-- -- buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- -- buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
-- -- buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
-- -- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
-- -- buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
-- -- buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
-- -- buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
-- -- buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
-- -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- -- buf_set_keymap("v", "<space>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)
