local glue = require('glue').register('telescope')

local function _map(event)
  return function() return glue.call(event) end
end

return {
  { [[<leader>att]], _map('telescope.actions.pick'), desc = 'Telescope' },

  { [[<leader>atf]], _map('telescope.actions.pick.file'), desc = 'File' },
  { [[<leader>ato]], _map('telescope.actions.pick.file.recent'), desc = 'Recent Files' },
  { [[<leader>atF]], _map('telescope.actions.pick.file.git'), desc = 'Git File' },

  { [[<leader>atb]], _map('telescope.actions.pick.buffer'), desc = 'Buffer' },

  { [[<leader>at//]], _map('telescope.actions.grep'), desc = 'Grep' },
  { [[<leader>at/w]], _map('telescope.actions.grep.word'), desc = 'Grep Word' },

  { [[<leader>at:]], _map('telescope.actions.pick.history.command'), desc = 'Command History' },

  { [[<leader>atc]], _map('telescope.actions.pick.command'), desc = 'Command' },
  { [[<leader>atC]], _map('telescope.actions.pick.colorscheme'), desc = 'Colorscheme' },
  { [[<leader>atL]], _map('telescope.actions.pick.line.buffer'), desc = 'Buffer Lines' },
  { [[<leader>ata]], _map('telescope.actions.pick.autocommand'), desc = 'Autocommand' },

  { [[<leader>atd]], _map('telescope.actions.pick.diagnostic.buffer'), desc = 'Buffer Diagnostics' },
  { [[<leader>atD]], _map('telescope.actions.pick.diagnostic'), desc = 'Diagnostics' },

  { [[<leader>ath]], _map('telescope.actions.pick.help'), desc = 'Help' },
  { [[<leader>atH]], _map('telescope.actions.pick.highlight'), desc = 'Highlight' },
  { [[<leader>ati]], _map('telescope.actions.pick.icon'), desc = 'Icon' },
  { [[<leader>atk]], _map('telescope.actions.pick.keymap'), desc = 'Keymap' },
  { [[<leader>atm]], _map('telescope.actions.pick.man'), desc = 'Man' },
  { [[<leader>at']], _map('telescope.actions.pick.mark'), desc = 'Mark' },
  { [[<leader>ats]], _map('telescope.actions.pick.tagstack'), desc = 'Tagstack' },
  { [[<leader>atv]], _map('telescope.actions.pick.vim.option'), desc = 'Vim Option' },

  { [[<leader>atGl]], _map('telescope.actions.pick.git.log'), desc = 'Git Log' },
  { [[<leader>atGs]], _map('telescope.actions.pick.git.status'), desc = 'Git Status' },

  { [[<leader>atld]], _map('telescope.lsp.actions.definition'), desc = 'Definition' },
  { [[<leader>atlD]], _map('telescope.lsp.actions.declaration'), desc = 'Declaration' },
  { [[<leader>atlr]], _map('telescope.lsp.actions.reference'), desc = 'References' },
  { [[<leader>atli]], _map('telescope.lsp.actions.implementation'), desc = 'Implementation' },
  { [[<leader>atlt]], _map('telescope.lsp.actions.type.definition'), desc = 'Type Definition' },
  { [[<leader>atlI]], _map('telescope.lsp.actions.call.incoming'), desc = 'Incoming Calls' },
  { [[<leader>atlO]], _map('telescope.lsp.actions.call.outgoing'), desc = 'Outgoing Calls' },
  { [[<leader>atls]], _map('telescope.lsp.actions.symbol.document'), desc = 'Document Symbols' },
  { [[<leader>atlw]], _map('telescope.lsp.actions.symbol.workspace'), desc = 'Workspace Symbols' },
  { [[<leader>atlW]], _map('telescope.lsp.actions.symbol.workspace.dynamic'), desc = 'Dynamic Workspace Symbols' },
}
