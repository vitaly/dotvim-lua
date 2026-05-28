local glue_map = require('lib.glue').map

return {
  { [[<leader>ass]], glue_map('snacks', 'snacks.actions.pick'), desc = 'Snacks' },

  { [[<leader>asf]], glue_map('snacks', 'snacks.actions.pick.file'), desc = 'File' },
  { [[<leader>aso]], glue_map('snacks', 'snacks.actions.pick.file.recent'), desc = 'Recent Files' },
  { [[<leader>asO]], glue_map('snacks', 'snacks.actions.pick.file.smart'), desc = 'Smart Files' },
  { [[<leader>asF]], glue_map('snacks', 'snacks.actions.pick.file.git'), desc = 'Git File' },

  { [[<leader>asb]], glue_map('snacks', 'snacks.actions.pick.buffer'), desc = 'Buffer' },

  { [[<leader>as//]], glue_map('snacks', 'snacks.actions.grep'), desc = 'Grep' },
  { [[<leader>as/w]], glue_map('snacks', 'snacks.actions.grep.word'), desc = 'Grep Word' },
  { [[<leader>as/b]], glue_map('snacks', 'snacks.actions.grep.buffers'), desc = 'Grep Buffers' },
  { [[<leader>as/g]], glue_map('snacks', 'snacks.actions.grep.git'), desc = 'Grep Git' },

  { [[<leader>as:]], glue_map('snacks', 'snacks.actions.pick.history.command'), desc = 'Command History' },
  { [[<leader>as?]], glue_map('snacks', 'snacks.actions.pick.history.search'), desc = 'Search History' },
  { [[<leader>asn]], glue_map('snacks', 'snacks.actions.pick.history.notification'), desc = 'Notifications' },

  { [[<leader>asc]], glue_map('snacks', 'snacks.actions.pick.command'), desc = 'Command' },
  { [[<leader>asC]], glue_map('snacks', 'snacks.actions.pick.colorscheme'), desc = 'Colorscheme' },
  { [[<leader>asL]], glue_map('snacks', 'snacks.actions.pick.line.buffer'), desc = 'Buffer Lines' },
  { [[<leader>asa]], glue_map('snacks', 'snacks.actions.pick.autocommand'), desc = 'Autocommand' },

  { [[<leader>asd]], glue_map('snacks', 'snacks.actions.pick.diagnostic.buffer'), desc = 'Buffer Diagnostics' },
  { [[<leader>asD]], glue_map('snacks', 'snacks.actions.pick.diagnostic'), desc = 'Diagnostics' },

  { [[<leader>ash]], glue_map('snacks', 'snacks.actions.pick.help'), desc = 'Help' },
  { [[<leader>asH]], glue_map('snacks', 'snacks.actions.pick.highlight'), desc = 'Highlight' },
  { [[<leader>asi]], glue_map('snacks', 'snacks.actions.pick.icon'), desc = 'Icon' },
  { [[<leader>asj]], glue_map('snacks', 'snacks.actions.pick.jump'), desc = 'Jump' },
  { [[<leader>ask]], glue_map('snacks', 'snacks.actions.pick.keymap'), desc = 'Keymap' },
  { [[<leader>asz]], glue_map('snacks', 'snacks.actions.pick.lazy'), desc = 'Lazy' },
  { [[<leader>asm]], glue_map('snacks', 'snacks.actions.pick.man'), desc = 'Man' },
  { [[<leader>as']], glue_map('snacks', 'snacks.actions.pick.mark'), desc = 'Mark' },
  { [[<leader>asq]], glue_map('snacks', 'snacks.actions.pick.quickfix'), desc = 'Quickfix' },
  { [[<leader>asQ]], glue_map('snacks', 'snacks.actions.pick.loc'), desc = 'Loclist' },
  { [[<leader>asr]], glue_map('snacks', 'snacks.actions.pick.register'), desc = 'Register' },
  { [[<leader>asR]], glue_map('snacks', 'snacks.actions.pick.resume'), desc = 'Resume' },
  { [[<leader>ast]], glue_map('snacks', 'snacks.actions.pick.todo'), desc = 'Todo' },
  { [[<leader>asu]], glue_map('snacks', 'snacks.actions.pick.undo'), desc = 'Undo' },
  { [[<leader>asp]], glue_map('snacks', 'snacks.actions.pick.project'), desc = 'Project' },

  { [[<leader>asGb]], glue_map('snacks', 'snacks.actions.pick.git.branch'), desc = 'Git Branch' },
  { [[<leader>asGl]], glue_map('snacks', 'snacks.actions.pick.git.log'), desc = 'Git Log' },
  { [[<leader>asGL]], glue_map('snacks', 'snacks.actions.pick.git.log.line'), desc = 'Git Log Line' },
  { [[<leader>asGf]], glue_map('snacks', 'snacks.actions.pick.git.log.file'), desc = 'Git Log File' },
  { [[<leader>asGs]], glue_map('snacks', 'snacks.actions.pick.git.status'), desc = 'Git Status' },
  { [[<leader>asGS]], glue_map('snacks', 'snacks.actions.pick.git.stash'), desc = 'Git Stash' },
  { [[<leader>asGd]], glue_map('snacks', 'snacks.actions.pick.git.diff'), desc = 'Git Diff' },

  { [[<leader>asld]], glue_map('snacks', 'snacks.lsp.actions.definition'), desc = 'Definition' },
  { [[<leader>aslD]], glue_map('snacks', 'snacks.lsp.actions.declaration'), desc = 'Declaration' },
  { [[<leader>aslr]], glue_map('snacks', 'snacks.lsp.actions.reference'), desc = 'References' },
  { [[<leader>asli]], glue_map('snacks', 'snacks.lsp.actions.implementation'), desc = 'Implementation' },
  { [[<leader>aslt]], glue_map('snacks', 'snacks.lsp.actions.type.definition'), desc = 'Type Definition' },
  { [[<leader>aslI]], glue_map('snacks', 'snacks.lsp.actions.call.incoming'), desc = 'Incoming Calls' },
  { [[<leader>aslO]], glue_map('snacks', 'snacks.lsp.actions.call.outgoing'), desc = 'Outgoing Calls' },
  { [[<leader>asls]], glue_map('snacks', 'snacks.lsp.actions.symbol.document'), desc = 'Document Symbols' },
  { [[<leader>aslw]], glue_map('snacks', 'snacks.lsp.actions.symbol.workspace'), desc = 'Workspace Symbols' },
  { [[<leader>aslc]], glue_map('snacks', 'snacks.lsp.actions.lsp_config'), desc = 'LSP Config' },

  { [[\i]], glue_map('snacks', 'snacks.actions.indent.toggle'), desc = 'Toggle Indent Scope' },

  { '<leader>#', function() Snacks.scratch() end, desc = 'Scratch File' },
  { '<leader>$', function() Snacks.scratch.select() end, desc = 'Select Scratch File' },
}
