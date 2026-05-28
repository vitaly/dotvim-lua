_t('file-tree/snacks')

local tools = require('lib.tools')

---@module 'snacks'

return tools.vplug({
  'plugins.file-tree.snacks',

  enabled = function()
    local c = require('onion.config')
    c.set_defaults('file-tree', { backend = 'plugins.file-tree.snacks', position = 'left' })
    return c.get('file-tree.backend') == 'plugins.file-tree.snacks'
  end,

  keys = require('plugins.file-tree.keys'),

  config = function()
    _t('file-tree/snacks: config')

    local glue = require('glue').register('file-tree.snacks')

    -- Popup explorer with reveal - uses different source name so it doesn't conflict with sidebar
    glue.handle('file-tree.actions.popup', function()
      local file = vim.api.nvim_buf_get_name(0)
      local Tree = require('snacks.explorer.tree')
      local Actions = require('snacks.explorer.actions')

      -- Open tree to current file before opening picker
      if file ~= '' and vim.uv.fs_stat(file) then Tree:open(file) end

      Snacks.picker.explorer({
        source = 'explorer_popup', -- different source name prevents conflict with sidebar
        layout = { preset = 'default', layout = { min_width = 40, width = 0.2 } },
        jump = { close = true },
        on_show = function(picker)
          if file ~= '' then Actions.update(picker, { target = file, refresh = true }) end
        end,
      })
    end)

    -- Sidebar explorer
    glue.handle('file-tree.actions.toggle', function() Snacks.explorer.open() end)
    glue.handle('file-tree.actions.reveal', function() Snacks.explorer.reveal() end)
  end,
})
