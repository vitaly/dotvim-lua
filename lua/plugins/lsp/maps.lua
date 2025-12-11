local M = {}

local config = require('onion.config')
local glue = require('glue').register('lsp')
local wk = require('which-key')

local function _map(event)
  return function() return glue.call(event) end
end

function M.global()
  require('plugins.lsp.actions').setup()
  wk.add({
    { [[<leader>al]], group = 'LSP' },

    { [[<leader>ali]], _map('lsp.actions.lsp_info'), desc = 'Info' },
    { [[<leader>all]], _map('lsp.actions.lsp_log'), desc = 'Log' },
    { [[<leader>als]], _map('lsp.actions.lsp_start'), desc = 'Start' },
    { [[<leader>alS]], _map('lsp.actions.lsp_stop'), desc = 'Stop' },
    { [[<leader>alr]], _map('lsp.actions.lsp_restart'), desc = 'Restart' },
    { [[<leader>alw]], _map('lsp.actions.lsp_workspace_folders'), desc = 'Workspace Folders' },
  })
end

function M.buffer(client, buf)
  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, buf) then
    vim.lsp.inlay_hint.enable(config.get('lsp.inlay_hints', false))
    wk.add({
      [[\h]],
      function() vim.lsp.inlay_hint.enable(config.toggle('lsp.inlay_hints', false)) end,
      buffer = buf,
      desc = 'Toggle Inlay Hints',
    })
  end

  wk.add({
    mode = 'n',
    buffer = buf,

    { 'gd', _map('lsp.actions.definition'), desc = 'Go to Definition' },
    { 'gD', _map('lsp.actions.declaration'), desc = 'Go to Declaration' },
    { 'gK', _map('lsp.actions.signature_help'), desc = 'Signature Help' },
    { 'gk', _map('lsp.actions.signature_help'), desc = 'Signature Help' },

    { '<localleader>g', desc = 'Go to' },
    { '<localleader>gd', _map('telescope.lsp.actions.definition'), desc = 'Go to Definition' },
    { '<localleader>gr', _map('telescope.lsp.actions.reference'), desc = 'Go to References' },
    { '<localleader>gi', _map('telescope.lsp.actions.implementation'), desc = 'Go to Implementation' },
    { '<localleader>gt', _map('telescope.lsp.actions.type.definition'), desc = 'Go to Type Definition' },

    { '<localleader>s', desc = 'Search' },
    { '<localleader>sd', _map('telescope.lsp.actions.symbol.document'), desc = 'Document Symbols' },
    { '<localleader>sw', _map('telescope.lsp.actions.symbol.workspace'), desc = 'Workspace Symbols' },
    { '<localleader>sW', _map('telescope.lsp.actions.symbol.workspace.dynamic'), desc = 'Dynamic Workspace Symbols' },

    --
    -- { '', _map('lsp.actions.buf.add_workspace_folder'), desc = 'Add Workspace folder' },
    -- { '', _map('lsp.actions.buf.code_action'), desc = 'Code Action' },
    -- { '', _map('lsp.actions.buf.document_symbol'), desc = 'Document Symbol' },
    -- { '', _map('lsp.actions.buf.implementation'), desc = 'Goto Implementation' },
    -- { '', _map('lsp.actions.buf.incoming_calls'), desc = 'Show Incoming Calls' },
    -- { '', _map('lsp.actions.buf.outgoing_calls'), desc = 'Show Outgoing Calls' },
    -- { '', _map('lsp.actions.buf.references'), desc = 'Show References' },
    -- { '', _map('lsp.actions.buf.remove_workspace_folder'), desc = 'Remove Workspace Folder' },
    -- { '', _map('lsp.actions.buf.signature_help'), desc = 'Signature Help' },
    -- { '', _map('lsp.actions.buf.type_definition'), desc = 'Type Definition' },
    -- { '', _map('lsp.actions.buf.workspace_symbol'), desc = 'Workspace Symbol' },
    --
  })
end

return M
