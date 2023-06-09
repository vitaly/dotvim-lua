return {
  setup = function()
    local function debug_toggle()
      _my.config.format.debug = not _my.config.format.debug
      print(string.format('formating debug %s', _my.config.format.debug and 'enabled' or 'disabled'))
    end

    local function format_toggle()
      vim.cmd [[FormatToggle]]
    end

    local function format_toggle_filetype()
      local ft = vim.api.nvim_buf_get_option(0, 'filetype')
      vim.cmd('FormatToggle ' .. ft)
    end

    local function format_cycle()
      local ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local config = _my.config.format.settings[ft] or {}
      if config.cycle then
        table.insert(config.cycle, table.remove(config.cycle, 1))
        vim.notify(string.format('format cycle: %s', table.concat(config.cycle, ', ')))
      else
        vim.notify('no cycle defined for filetype ' .. ft, vim.log.levels.WARN)
      end
    end

    require('which-key').register {

      ['<leader>sf'] = {
        function()
          PRINT(_my.config.format)
          vim.cmd [[messages]]
        end,
        'Format Config',
      },

      ['<localleader>'] = {
        f = { require('layers.ide.format.config').format_buffer, 'Format' },
      },

      ['\\'] = {
        a = {
          name = 'AutoFormat',
          a = { format_toggle, 'Autoformat' },
          f = { format_toggle_filetype, 'Filetype' },
          c = { format_cycle, 'Format Next Client' },
        },

        d = {
          name = 'Debug',
          f = { debug_toggle, 'Format' },
        },
      },
    }
  end,
}
