local glue_map = require('lib.glue').map

return {
  { [[<leader>att]], glue_map('telescope', 'telescope.actions.pick'), desc = 'Telescope' },

  { [[<leader>atf]], glue_map('telescope', 'telescope.actions.pick.file'), desc = 'File' },
  { [[<leader>ato]], glue_map('telescope', 'telescope.actions.pick.file.recent'), desc = 'Recent Files' },
  { [[<leader>atF]], glue_map('telescope', 'telescope.actions.pick.file.git'), desc = 'Git File' },

  { [[<leader>atb]], glue_map('telescope', 'telescope.actions.pick.buffer'), desc = 'Buffer' },

  { [[<leader>at//]], glue_map('telescope', 'telescope.actions.grep'), desc = 'Grep' },
  { [[<leader>at/w]], glue_map('telescope', 'telescope.actions.grep.word'), desc = 'Grep Word' },

  { [[<leader>at:]], glue_map('telescope', 'telescope.actions.pick.history.command'), desc = 'Command History' },

  { [[<leader>atc]], glue_map('telescope', 'telescope.actions.pick.command'), desc = 'Command' },
  { [[<leader>atC]], glue_map('telescope', 'telescope.actions.pick.colorscheme'), desc = 'Colorscheme' },
  { [[<leader>atL]], glue_map('telescope', 'telescope.actions.pick.line.buffer'), desc = 'Buffer Lines' },
  { [[<leader>ata]], glue_map('telescope', 'telescope.actions.pick.autocommand'), desc = 'Autocommand' },

  { [[<leader>atd]], glue_map('telescope', 'telescope.actions.pick.diagnostic.buffer'), desc = 'Buffer Diagnostics' },
  { [[<leader>atD]], glue_map('telescope', 'telescope.actions.pick.diagnostic'), desc = 'Diagnostics' },

  { [[<leader>ath]], glue_map('telescope', 'telescope.actions.pick.help'), desc = 'Help' },
  { [[<leader>atH]], glue_map('telescope', 'telescope.actions.pick.highlight'), desc = 'Highlight' },
  { [[<leader>ati]], glue_map('telescope', 'telescope.actions.pick.icon'), desc = 'Icon' },
  { [[<leader>atk]], glue_map('telescope', 'telescope.actions.pick.keymap'), desc = 'Keymap' },
  { [[<leader>atm]], glue_map('telescope', 'telescope.actions.pick.man'), desc = 'Man' },
  { [[<leader>at']], glue_map('telescope', 'telescope.actions.pick.mark'), desc = 'Mark' },
  { [[<leader>ats]], glue_map('telescope', 'telescope.actions.pick.tagstack'), desc = 'Tagstack' },
  { [[<leader>atv]], glue_map('telescope', 'telescope.actions.pick.vim.option'), desc = 'Vim Option' },

  { [[<leader>atGl]], glue_map('telescope', 'telescope.actions.pick.git.log'), desc = 'Git Log' },
  { [[<leader>atGs]], glue_map('telescope', 'telescope.actions.pick.git.status'), desc = 'Git Status' },

  { [[<leader>atld]], glue_map('telescope', 'telescope.lsp.actions.definition'), desc = 'Definition' },
  { [[<leader>atlD]], glue_map('telescope', 'telescope.lsp.actions.declaration'), desc = 'Declaration' },
  { [[<leader>atlr]], glue_map('telescope', 'telescope.lsp.actions.reference'), desc = 'References' },
  { [[<leader>atli]], glue_map('telescope', 'telescope.lsp.actions.implementation'), desc = 'Implementation' },
  { [[<leader>atlt]], glue_map('telescope', 'telescope.lsp.actions.type.definition'), desc = 'Type Definition' },
  { [[<leader>atlI]], glue_map('telescope', 'telescope.lsp.actions.call.incoming'), desc = 'Incoming Calls' },
  { [[<leader>atlO]], glue_map('telescope', 'telescope.lsp.actions.call.outgoing'), desc = 'Outgoing Calls' },
  { [[<leader>atls]], glue_map('telescope', 'telescope.lsp.actions.symbol.document'), desc = 'Document Symbols' },
  { [[<leader>atlw]], glue_map('telescope', 'telescope.lsp.actions.symbol.workspace'), desc = 'Workspace Symbols' },
  { [[<leader>atlW]], glue_map('telescope', 'telescope.lsp.actions.symbol.workspace.dynamic'), desc = 'Dynamic Workspace Symbols' },
}
