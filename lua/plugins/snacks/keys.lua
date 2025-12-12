local glue = require('glue').register('snacks')

local function _map(event)
  return function() return glue.call(event) end
end

return {
  { [[<leader>ass]], _map('snacks.actions.pick'), desc = 'Snacks' },

  { [[<leader>asf]], _map('snacks.actions.pick.file'), desc = 'File' },
  { [[<leader>aso]], _map('snacks.actions.pick.file.recent'), desc = 'Recent Files' },
  { [[<leader>asO]], _map('snacks.actions.pick.file.smart'), desc = 'Smart Files' },
  { [[<leader>asF]], _map('snacks.actions.pick.file.git'), desc = 'Git File' },

  { [[<leader>asb]], _map('snacks.actions.pick.buffer'), desc = 'Buffer' },

  { [[<leader>as//]], _map('snacks.actions.grep'), desc = 'Grep' },
  { [[<leader>as/w]], _map('snacks.actions.grep.word'), desc = 'Grep Word' },
  { [[<leader>as/b]], _map('snacks.actions.grep.buffers'), desc = 'Grep Buffers' },
  { [[<leader>as/g]], _map('snacks.actions.grep.git'), desc = 'Grep Git' },

  { [[<leader>as:]], _map('snacks.actions.pick.history.command'), desc = 'Command History' },
  { [[<leader>as?]], _map('snacks.actions.pick.history.search'), desc = 'Search History' },
  { [[<leader>asn]], _map('snacks.actions.pick.history.notification'), desc = 'Notifications' },

  { [[<leader>asc]], _map('snacks.actions.pick.command'), desc = 'Command' },
  { [[<leader>asC]], _map('snacks.actions.pick.colorscheme'), desc = 'Colorscheme' },
  { [[<leader>asL]], _map('snacks.actions.pick.line.buffer'), desc = 'Buffer Lines' },
  { [[<leader>asa]], _map('snacks.actions.pick.autocommand'), desc = 'Autocommand' },

  { [[<leader>asd]], _map('snacks.actions.pick.diagnostic.buffer'), desc = 'Buffer Diagnostics' },
  { [[<leader>asD]], _map('snacks.actions.pick.diagnostic'), desc = 'Diagnostics' },

  { [[<leader>ash]], _map('snacks.actions.pick.help'), desc = 'Help' },
  { [[<leader>asH]], _map('snacks.actions.pick.highlight'), desc = 'Highlight' },
  { [[<leader>asi]], _map('snacks.actions.pick.icon'), desc = 'Icon' },
  { [[<leader>asj]], _map('snacks.actions.pick.jump'), desc = 'Jump' },
  { [[<leader>ask]], _map('snacks.actions.pick.keymap'), desc = 'Keymap' },
  { [[<leader>asz]], _map('snacks.actions.pick.lazy'), desc = 'Lazy' },
  { [[<leader>asm]], _map('snacks.actions.pick.man'), desc = 'Man' },
  { [[<leader>as']], _map('snacks.actions.pick.mark'), desc = 'Mark' },
  { [[<leader>asq]], _map('snacks.actions.pick.quickfix'), desc = 'Quickfix' },
  { [[<leader>asQ]], _map('snacks.actions.pick.loc'), desc = 'Loclist' },
  { [[<leader>asr]], _map('snacks.actions.pick.register'), desc = 'Register' },
  { [[<leader>asR]], _map('snacks.actions.pick.resume'), desc = 'Resume' },
  { [[<leader>ast]], _map('snacks.actions.pick.todo'), desc = 'Todo' },
  { [[<leader>asu]], _map('snacks.actions.pick.undo'), desc = 'Undo' },
  { [[<leader>asp]], _map('snacks.actions.pick.project'), desc = 'Project' },

  { [[<leader>asGb]], _map('snacks.actions.pick.git.branch'), desc = 'Git Branch' },
  { [[<leader>asGl]], _map('snacks.actions.pick.git.log'), desc = 'Git Log' },
  { [[<leader>asGL]], _map('snacks.actions.pick.git.log.line'), desc = 'Git Log Line' },
  { [[<leader>asGf]], _map('snacks.actions.pick.git.log.file'), desc = 'Git Log File' },
  { [[<leader>asGs]], _map('snacks.actions.pick.git.status'), desc = 'Git Status' },
  { [[<leader>asGS]], _map('snacks.actions.pick.git.stash'), desc = 'Git Stash' },
  { [[<leader>asGd]], _map('snacks.actions.pick.git.diff'), desc = 'Git Diff' },

  { [[<leader>asld]], _map('snacks.lsp.actions.definition'), desc = 'Definition' },
  { [[<leader>aslD]], _map('snacks.lsp.actions.declaration'), desc = 'Declaration' },
  { [[<leader>aslr]], _map('snacks.lsp.actions.reference'), desc = 'References' },
  { [[<leader>asli]], _map('snacks.lsp.actions.implementation'), desc = 'Implementation' },
  { [[<leader>aslt]], _map('snacks.lsp.actions.type.definition'), desc = 'Type Definition' },
  { [[<leader>aslI]], _map('snacks.lsp.actions.call.incoming'), desc = 'Incoming Calls' },
  { [[<leader>aslO]], _map('snacks.lsp.actions.call.outgoing'), desc = 'Outgoing Calls' },
  { [[<leader>asls]], _map('snacks.lsp.actions.symbol.document'), desc = 'Document Symbols' },
  { [[<leader>aslw]], _map('snacks.lsp.actions.symbol.workspace'), desc = 'Workspace Symbols' },
  { [[<leader>aslc]], _map('snacks.lsp.actions.lsp_config'), desc = 'LSP Config' },

  { [[\i]], _map('snacks.actions.indent.toggle'), desc = 'Toggle Indent Scope' },

  { '<leader>#', function() Snacks.scratch() end, desc = 'Scratch File' },
  { '<leader>$', function() Snacks.scratch.select() end, desc = 'Select Scratch File' },
}
