return {
  config = function()
    local mode_toggle = require('lib.toggle').toggler('g:colorizer_mode', { 'virtualtext', 'foreground', 'background' })

    require('colorizer').setup { user_default_options = { mode = 'foreground' } }

    require('which-key').register {
      ["\\'"] = {
        c = {
          function()
            local c = require 'colorizer'
            if c.is_buffer_attached(0) then
              c.detach_from_buffer(0)
            else
              local mode = vim.g.colorizer_mode or 'foreground'
              c.attach_to_buffer(0, { mode = mode })
            end
          end,
          'Colorizer',
        },

        C = { mode_toggle, 'Colorizer Color' },
      },
    }
  end,
}
