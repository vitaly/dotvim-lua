local glue = require('glue').register('telescope.actions')

-- return function that will execute the given telescope command
local function telescope(cmd)
  return function() vim.cmd.Telescope(cmd) end
end

local M = {}

function M.stop() glue.clear('*') end

M.actions = {
  ['telescope.lsp.actions.definition'] = function() vim.cmd.Telescope('lsp_definitions') end,
  ['telescope.lsp.actions.references'] = function() vim.cmd.Telescope('lsp_references') end,

  ['telescope.lsp.actions.implementation'] = function() vim.cmd.Telescope('lsp_implementations') end,
  ['telescope.lsp.actions.type_definition'] = function() vim.cmd.Telescope('lsp_type_definitions') end,
  ['telescope.lsp.actions.document_symbols'] = function() vim.cmd.Telescope('lsp_document_symbols') end,
  ['telescope.lsp.actions.workspace_symbols'] = function() vim.cmd.Telescope('lsp_workspace_symbols') end,
  ['telescope.lsp.actions.dynamic_workspace_symbols'] = function() vim.cmd.Telescope('lsp_dynamic_workspace_symbols') end,
  ['telescope.lsp.actions.outgoing_calls'] = function() vim.cmd.Telescope('lsp_outgoing_calls') end,
  ['telescope.lsp.actions.incoming_calls'] = function() vim.cmd.Telescope('lsp_incoming_calls') end,

  ['telescope.actions.autocommands'] = function() vim.cmd.Telescope('autocommands') end,
  ['telescope.actions.buffer_diagnostics'] = function() vim.cmd.Telescope('diagnostics', 'buffnr=0') end,
  ['telescope.actions.diagnostics'] = function() vim.cmd.Telescope('diagnostics') end,
  ['telescope.actions.buffers'] = function() vim.cmd.Telescope('buffers') end,
  ['telescope.actions.colorscheme'] = function() vim.cmd.Telescope('colorscheme', 'enable_preview= true') end,
  ['telescope.actions.command_history'] = function() vim.cmd.Telescope('command_history') end,

  ['telescope.actions.commands'] = function() vim.cmd.Telescope('commands') end,
  ['telescope.actions.find_files'] = function() vim.cmd.Telescope('find_files') end,
  ['telescope.actions.git_commits'] = function() vim.cmd.Telescope('git_commits') end,
  ['telescope.actions.git_files'] = function() vim.cmd.Telescope('git_files') end,
  ['telescope.actions.git_status'] = function() vim.cmd.Telescope('git_status') end,
  ['telescope.actions.grep_string'] = function() vim.cmd.Telescope('grep_string') end,
  ['telescope.actions.help_tags'] = function() vim.cmd.Telescope('help_tags') end,
  ['telescope.actions.highlights'] = function() vim.cmd.Telescope('highlights') end,
  ['telescope.actions.keymaps'] = function() vim.cmd.Telescope('keymaps') end,
  ['telescope.actions.buffer_lines'] = function() vim.cmd.Telescope('current_buffer_fuzzy_find') end,
  ['telescope.actions.live_grep'] = function() vim.cmd.Telescope('live_grep') end,
  ['telescope.actions.man_pages'] = function() vim.cmd.Telescope('man_pages') end,
  ['telescope.actions.marks'] = function() vim.cmd.Telescope('marks') end,
  ['telescope.actions.recent_files'] = function() vim.cmd.Telescope('oldfiles') end,
  ['telescope.actions.symbols'] = function() vim.cmd.Telescope('symbols') end,
  ['telescope.actions.tagstack'] = function() vim.cmd.Telescope('tagstack') end,
  ['telescope.actions.telescope'] = function() vim.cmd.Telescope() end,
  ['telescope.actions.vim_options'] = function() vim.cmd.Telescope('vim_options') end,
}

function M.start()
  M.stop()
  for name, action in pairs(M.actions) do
    glue.listen(name, action)
  end
end

return M
