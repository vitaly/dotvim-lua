local config = require('onion.config')
---@module 'snacks'
return require('lib.actions').register('snacks.actions', {
  ['snacks.actions.pick'] = function() return Snacks.picker() end,

  ['snacks.actions.pick.file'] = function() return Snacks.picker.files() end,
  ['snacks.actions.pick.file.recent'] = function() return Snacks.picker.recent() end,
  ['snacks.actions.pick.file.smart'] = function() return Snacks.picker.smart() end,
  ['snacks.actions.pick.file.git'] = function() return Snacks.picker.git_files() end,
  ['snacks.actions.pick.buffer'] = function() return Snacks.picker.buffers() end,
  ['snacks.actions.grep'] = function() return Snacks.picker.grep() end,
  ['snacks.actions.grep.word'] = function() return Snacks.picker.grep_word() end,
  ['snacks.actions.grep.buffers'] = function() return Snacks.picker.grep_buffers() end,
  ['snacks.actions.grep.git'] = function() return Snacks.picker.git_grep() end,
  ['snacks.actions.pick.history.search'] = function() return Snacks.picker.search_history() end,
  ['snacks.actions.pick.history.command'] = function() return Snacks.picker.command_history() end,
  ['snacks.actions.pick.history.notification'] = function() return Snacks.picker.notifications() end,
  ['snacks.actions.pick.git.branch'] = function() return Snacks.picker.git_branches() end,
  ['snacks.actions.pick.git.log'] = function() return Snacks.picker.git_log() end,
  ['snacks.actions.pick.git.log.line'] = function() return Snacks.picker.git_log_line() end,
  ['snacks.actions.pick.git.status'] = function() return Snacks.picker.git_status() end,
  ['snacks.actions.pick.git.stash'] = function() return Snacks.picker.git_stash() end,
  ['snacks.actions.pick.git.diff'] = function() return Snacks.picker.git_diff() end,
  ['snacks.actions.pick.colorscheme'] = function() return Snacks.picker.colorschemes() end,
  ['snacks.actions.pick.git.log.file'] = function() return Snacks.picker.git_log_file() end,
  ['snacks.actions.pick.line.buffer'] = function() return Snacks.picker.lines() end,
  ['snacks.actions.pick.register'] = function() return Snacks.picker.registers() end,
  ['snacks.actions.pick.autocommand'] = function() return Snacks.picker.autocmds() end,
  ['snacks.actions.pick.command'] = function() return Snacks.picker.commands() end,
  ['snacks.actions.pick.diagnostic'] = function() return Snacks.picker.diagnostics() end,
  ['snacks.actions.pick.diagnostic.buffer'] = function() return Snacks.picker.diagnostics_buffer() end,
  ['snacks.actions.pick.help'] = function() return Snacks.picker.help() end,
  ['snacks.actions.pick.highlight'] = function() return Snacks.picker.highlights() end,
  ['snacks.actions.pick.icon'] = function() return Snacks.picker.icons() end,
  ['snacks.actions.pick.jump'] = function() return Snacks.picker.jumps() end,
  ['snacks.actions.pick.keymap'] = function() return Snacks.picker.keymaps() end,
  ['snacks.actions.pick.loc'] = function() return Snacks.picker.loclist() end,
  ['snacks.actions.pick.mark'] = function() return Snacks.picker.marks() end,
  ['snacks.actions.pick.man'] = function() return Snacks.picker.man() end,
  ['snacks.actions.pick.lazy'] = function() return Snacks.picker.lazy() end,
  ['snacks.actions.pick.quickfix'] = function() return Snacks.picker.qflist() end,
  ['snacks.actions.pick.resume'] = function() return Snacks.picker.resume() end,
  ['snacks.actions.pick.undo'] = function() return Snacks.picker.undo() end,
  ['snacks.actions.pick.project'] = function() return Snacks.picker.projects() end,
  ['snacks.actions.pick.todo'] = function() return Snacks.picker.todo_comments() end,

  ['snacks.lsp.actions.definition'] = function() return Snacks.picker.lsp_definitions() end,
  ['snacks.lsp.actions.declaration'] = function() return Snacks.picker.lsp_declarations() end,
  ['snacks.lsp.actions.reference'] = function() return Snacks.picker.lsp_references() end,
  ['snacks.lsp.actions.implementation'] = function() return Snacks.picker.lsp_implementations() end,
  ['snacks.lsp.actions.type.definition'] = function() return Snacks.picker.lsp_type_definitions() end,
  ['snacks.lsp.actions.call.incoming'] = function() return Snacks.picker.lsp_incoming_calls() end,
  ['snacks.lsp.actions.call.outgoing'] = function() return Snacks.picker.lsp_outgoing_calls() end,
  ['snacks.lsp.actions.symbol.document'] = function() return Snacks.picker.lsp_symbols() end,
  ['snacks.lsp.actions.symbol.workspace'] = function() return Snacks.picker.lsp_workspace_symbols() end,

  ['snacks.lsp.actions.lsp_config'] = function() return Snacks.picker.lsp_config() end,

  ['snacks.actions.indent.toggle'] = function()
    if Snacks.indent.enabled then
      Snacks.indent.disable()
    else
      Snacks.indent.enable()
    end
    config.set('snacks.setup.indent.enabled', Snacks.indent.enabled)
  end,
})
