local function _clear()
  require('noice.message.manager')._history = {}
  vim.cmd('messages clear')
end

return {
  ------------------------------------------------------------------------------
  -- noice.nvim
  ------------------------------------------------------------------------------
  'rcarriga/nvim-notify',
  {
    'folke/noice.nvim',

    event = 'VeryLazy',
    -- enabled = false,

    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim', -- https://github.com/MunifTanjim/nui.nvim
      'rcarriga/nvim-notify',
    },

    init = function()
      require('which-key').add({
        { '<leader>m', group = 'Messages' },
        { '<leader>ma', '<cmd>Noice all<cr>', desc = '[A]ll Messages' },
        { '<leader>mm', '<cmd>Noice all<cr>', desc = 'All [M]essages' }, -- muscle memory, historical reasons.
        { '<leader>me', '<cmd>Noice errors<cr>', desc = '[E]rror Messages' },
        { '<leader>md', '<cmd>Noice debug<cr>', desc = '[D]ebug Messages' },
        { '<leader>m/', '<cmd>Noice pick<cr>', desc = 'Search Messages' },
        { '<leader>m?', '<cmd>Noice last<cr>', desc = 'Last Messages[?]' },

        { '<esc><esc>', '<cmd>Noice dismiss<cr>', desc = 'Dismiss Messages' },

        { '<leader>mD', '<cmd>Noice disable<cr>', desc = 'Disable Noice Messaging' },
        { '<leader>mE', '<cmd>Noice enable<cr>', desc = 'Enable Noice Messaging' },

        { '<leader>mc', _clear, desc = 'Clear Message History' },
        { '<leader>mx', _clear, desc = 'Clear Message History' },

        {
          '<leader>mg',
          function()
            my.log.trace('A trace message')
            my.log.debug('A debug message')
            my.log.info('An info message')
            my.log.warn('A warning message')
            my.log.error('An error message')
          end,
          desc = 'Generate some messages',
        },

        -- { '<leader>mm', '<cmd>messages<cr>', desc = '[m]essages' },
        -- { '<leader>mM', '<cmd>messages clear<cr>', desc = '[M]essages Clear' },
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
