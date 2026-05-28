local M = {}

local config = require('onion.config')
local wk = require('which-key')
local glue_map = require('lib.glue').map

function M.global()
  require('plugins.lsp.actions').setup()
  wk.add({
    { [[<leader>al]], group = 'LSP' },

    { [[<leader>ali]], glue_map('lsp', 'lsp.actions.lsp_info'), desc = 'Info' },
    { [[<leader>all]], glue_map('lsp', 'lsp.actions.lsp_log'), desc = 'Log' },
    { [[<leader>als]], glue_map('lsp', 'lsp.actions.lsp_start'), desc = 'Start' },
    { [[<leader>alS]], glue_map('lsp', 'lsp.actions.lsp_stop'), desc = 'Stop' },
    { [[<leader>alr]], glue_map('lsp', 'lsp.actions.lsp_restart'), desc = 'Restart' },
    { [[<leader>alw]], glue_map('lsp', 'lsp.actions.lsp_workspace_folders'), desc = 'Workspace Folders' },
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

    { 'gd', glue_map('lsp', 'lsp.actions.definition'), desc = 'Go to Definition' },
    { 'gD', glue_map('lsp', 'lsp.actions.declaration'), desc = 'Go to Declaration' },
    { 'gk', glue_map('lsp', 'lsp.actions.signature_help'), desc = 'Signature Help' },

    { '<localleader>g', desc = 'Go to' },
    { '<localleader>gd', glue_map('lsp', 'telescope.lsp.actions.definition'), desc = 'Go to Definition' },
    { '<localleader>gr', glue_map('lsp', 'telescope.lsp.actions.reference'), desc = 'Go to References' },
    { '<localleader>gi', glue_map('lsp', 'telescope.lsp.actions.implementation'), desc = 'Go to Implementation' },
    { '<localleader>gt', glue_map('lsp', 'telescope.lsp.actions.type.definition'), desc = 'Go to Type Definition' },

    { '<localleader>s', desc = 'Search' },
    { '<localleader>sd', glue_map('lsp', 'telescope.lsp.actions.symbol.document'), desc = 'Document Symbols' },
    { '<localleader>sw', glue_map('lsp', 'telescope.lsp.actions.symbol.workspace'), desc = 'Workspace Symbols' },
    { '<localleader>sW', glue_map('lsp', 'telescope.lsp.actions.symbol.workspace.dynamic'), desc = 'Dynamic Workspace Symbols' },

    --
    -- { '', glue_map('lsp', 'lsp.actions.buf.add_workspace_folder'), desc = 'Add Workspace folder' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.code_action'), desc = 'Code Action' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.document_symbol'), desc = 'Document Symbol' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.implementation'), desc = 'Goto Implementation' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.incoming_calls'), desc = 'Show Incoming Calls' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.outgoing_calls'), desc = 'Show Outgoing Calls' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.references'), desc = 'Show References' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.remove_workspace_folder'), desc = 'Remove Workspace Folder' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.signature_help'), desc = 'Signature Help' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.type_definition'), desc = 'Type Definition' },
    -- { '', glue_map('lsp', 'lsp.actions.buf.workspace_symbol'), desc = 'Workspace Symbol' },
    --
  })
end

return M
