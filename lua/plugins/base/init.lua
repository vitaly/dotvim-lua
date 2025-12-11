return {

  -- glue
  {
    'vitaly/glue.nvim', -- https://github.com/vitaly/glue.nvim
  },

  -- onion.nvim
  {
    'vitaly/onion.nvim', -- https://github.com/vitaly/onion.nvim

    init = function()
      require('which-key').add({
        { '<leader>ao', group = 'Onion Config' },
      })
    end,

    keys = {
      { '<leader>aoe', '<cmd>Onion edit<cr>', desc = 'Edit Config' },
      { '<leader>aos', '<cmd>Onion save<cr>', desc = 'Save Config' },
      { '<leader>aoi', '<cmd>Onion show<cr>', desc = 'Show Config' },
      { '<leader>aol', '<cmd>Onion load<cr>', desc = 'Load Config' },
      { '<leader>aod', '<cmd>Onion show --defaults<cr>', desc = 'Show Default Config' },
      { '<leader>aou', '<cmd>Onion show --user<cr>', desc = 'Show User Config' },
    },

    ---@module 'onion.config'
    ---@type OnionSetupOpts
    opts = {
      save_path = vim.fn.stdpath('config') .. '/config.lua',
      auto_save = true,

      defaults = {
        log_level = vim.log.levels.WARN,
      },
    },
  },
  -- onion-ui.nvim
  {
    'vitaly/onion-ui.nvim',
    enabled = true,
    keys = {
      { '<leader>aoo', function() require('onion-ui').start() end, desc = 'Onion UI' },
    },
  },
  -- noice.nvim
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
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
  -- lazydev.nvim
  {
    'folke/lazydev.nvim', -- https://github.com/folke/lazydev.nvim
    ft = 'lua',
    opts = {
      library = {
        'nvim-dap-ui',
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
