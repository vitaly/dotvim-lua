---------------------------------------------------------------------------
-- Setup local buffer maps for LSP
local function setup_lsp_keymaps(bufnr)
  local lsp = require 'layers.ide.lsp.maps'
  local tele = require 'layers.telescope.maps'

  require('which-key').register({

    gd = { tele.lsp.definition, 'Definition' },
    gD = { tele.lsp.type_definition, 'Declaration' },
    gi = { tele.lsp.implementation, 'Implementation' },
    gr = { tele.lsp.references, 'References' },

    K = { lsp.hover, 'Hover' },

    ['<localleader>'] = {
      r = {
        name = 'Refactor',
        r = { lsp.rename, 'Refactor(Rename)' },
      },

      a = { lsp.code_action, 'Code Action' },

      ['1'] = { lsp.first_diagnostic, 'First Problem' },
      n = { lsp.next_diagnostic, 'Next Problem' },
      p = { lsp.prev_diagnostic, 'Prev Problem' },

      g = {
        name = 'Go to',

        d = { tele.lsp.definition, 'Definition' },
        D = { tele.lsp.type_definition, 'Declaration' },
        i = { tele.lsp.implementation, 'Implementation' },
        r = { tele.lsp.references, 'References' },

        n = { tele.lsp.incoming_calls, 'Incoming Calls' },
        o = { tele.lsp.outgoing_calls, 'Outgoing Calls' },

        s = { tele.lsp.document_symbol, 'Document Symbol' },
        w = { tele.lsp.workspace_symbol, 'Workspace Symbol' },
        W = { tele.lsp.dynamic_workspace_symbol, 'Dynamic Workspace Symbol' },
      },
    },
  }, { buffer = bufnr })

  nmap({ 'buffer' }, '<C-LeftMouse>', '<LeftMouse><cmd>lua vim.lsp.buf.definition()<cr>')
  nmap({ 'buffer' }, '<A-LeftMouse>', '<LeftMouse><cmd>lua vim.lsp.buf.hover()<cr>')
end

local function setup_highlight(client)
  if client.server_capabilities.documentHighlightProvider ~= true then
    return
  end

  vim.cmd [[
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
local function on_attach(client, bufnr)
  setup_lsp_keymaps(bufnr)
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
