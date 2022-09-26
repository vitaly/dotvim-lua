return {
  setup = function ()

    local function debug_toggle()
      _my.config.format.debug = not _my.config.format.debug
      print(string.format('formating debug %s', _my.config.format.debug and 'enabled' or 'disabled'))
    end

    local function format_toggle()
      vim.cmd [[FormatToggle]]
    end

    local function format_toggle_filetype()
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      vim.cmd('FormatToggle ' .. buf_ft)
    end

    require('which-key').register {
      ['<localleader>'] = {
        f = { require('layers.ide.format.config').format_buffer, 'Format' },
        c = { function() PRINT(_my.config.format) end, 'Format Config'},
      },

      ['\\'] = {
        a = {
          name = 'AutoFormat',
          a = { format_toggle, 'Autoformat' },
          f = { format_toggle_filetype, 'Filetype' },
        },

        d = {
          name = 'Debug',
          f = { debug_toggle, 'Format' },
        },

      },
    }
  end
}
