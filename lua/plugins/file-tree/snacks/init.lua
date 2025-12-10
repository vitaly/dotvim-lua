local tools = require('lib.tools')

---@module 'snacks'

return tools.vplug({
  'plugins.file-tree.snacks',

  config = function()
    local glue = require('glue').register('file-tree.snacks')
    glue.handle(
      'file-tree.actions.popup',
      function() Snacks.picker.explorer({ layout = { preset = 'default', layout = { min_width = 40, width = 0.2 } }, jump = { close = true } }) end
    )
    glue.handle('file-tree.actions.toggle', function() Snacks.explorer.open() end)
    glue.handle('file-tree.actions.reveal', function() Snacks.explorer.reveal() end)
  end,
})
