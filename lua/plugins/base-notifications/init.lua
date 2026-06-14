local function noice_or_messages(noice_cmd)
  return function()
    if require('noice.config')._running then
      return '<cmd>' .. noice_cmd .. '<cr>'
    else
      return '<cmd>messages<cr>'
    end
  end
end

local function toggle_noice()
  if require('noice.config')._running then
    vim.cmd('Noice disable')
    vim.notify('Noice disabled')
  else
    vim.cmd('Noice enable')
    vim.notify('Noice enabled')
  end
end

local function print_trace()
  for _, v in ipairs(__t) do
    print(vim.inspect(v))
  end
end

local function generate_test_messages()
  my.log.trace('A trace message')
  my.log.debug('A debug message')
  my.log.info('An info message')
  my.log.warn('A warning message')
  my.log.error('An error message')
end

local function clear_messages()
  require('noice.message.manager')._history = {}
  vim.cmd('messages clear')
end

return {
  ------------------------------------------------------------------------------
  -- noice.nvim
  ------------------------------------------------------------------------------
  'rcarriga/nvim-notify',
  {
    'folke/noice.nvim', -- https://github.com/folke/noice.nvim

    event = 'VeryLazy',
    -- enabled = false,

    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim', -- https://github.com/MunifTanjim/nui.nvim
      'rcarriga/nvim-notify',
    },

    init = function()
      require('which-key').add({
        { '<esc><esc>', '<cmd>Noice dismiss<cr>', desc = 'Dismiss Messages' },

        { '<leader>m', group = 'Messages' },
        { '<leader>mm', noice_or_messages('Noice all'), expr = true, desc = 'All [m]essages' }, -- muscle memory, historical reasons.

        { '<leader>me', noice_or_messages('Noice errors'), expr = true, desc = '[e]rror Messages' },

        { '<leader>m/', '<cmd>Noice pick<cr>', desc = 'Search Messages' },
        { '<leader>m?', '<cmd>Noice last<cr>', desc = 'Last Messages[?]' },

        { '<leader>mD', '<cmd>Noice disable<cr>', desc = '[d]isable Noice Messaging' },
        { '<leader>mE', '<cmd>Noice enable<cr>', desc = '[e]nable Noice Messaging' },

        { '<leader>mc', clear_messages, desc = '[c]lear Message History' },
        { '<leader>mT', toggle_noice, desc = '[t]oggle Noice' },
        { '\\m', toggle_noice, desc = 'Toggle [m]essage noice' },

        { '<leader>mt', print_trace, desc = 'print trace' },

        { '<leader>mg', generate_test_messages, desc = 'Generate some messages' },
      })
    end,

    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      }, -- add any options here
    },
  },
}
