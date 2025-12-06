local glue = require('glue').register('telescope')

return {
  -------------------------------------------------------------------------------
  -- Telescope
  -------------------------------------------------------------------------------
  {
    'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
    dependencies = {
      'vitaly/glue.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-symbols.nvim',
    },
    cmd = 'Telescope',

    keys = {
      { [[<leader>sd]], function() glue.emit('telescope.actions.buffer_diagnostics') end, desc = 'Buffer Diagnostics' },
      { [[<leader>sa]], function() glue.emit('telescope.actions.autocommands') end, desc = 'Autocommands' },
      { [[<leader>bb]], function() glue.emit('telescope.actions.buffers') end, desc = 'Find buffer' },
      { [[<leader>sb]], function() glue.emit('telescope.actions.buffers') end, desc = 'Find buffer' },
      { [[<leader>sC]], function() glue.emit('telescope.actions.colorscheme') end, desc = 'Find Colorscheme' },
      { [[<leader>s:]], function() glue.emit('telescope.actions.command_history') end, desc = 'Command History' },
      { [[<leader><cr>]], function() glue.emit('telescope.actions.commands') end, desc = 'Find Command' },
      { [[<leader>sc]], function() glue.emit('telescope.actions.commands') end, desc = 'Find Command' },
      { [[<leader>sD]], function() glue.emit('telescope.actions.diagnostics') end, desc = 'Diagnostics' },
      { [[<leader>ff]], function() glue.emit('telescope.actions.find_files') end, desc = 'Find File' },
      { [[<localleader><localleader>]], function() glue.emit('telescope.actions.find_files') end, desc = 'Find File' },
      { [[<leader>gc]], function() glue.emit('telescope.actions.git_commits') end, desc = 'Find Git Commit' },
      { [[<leader>gf]], function() glue.emit('telescope.actions.git_files') end, desc = 'Find Git File' },
      { [[<leader>gS]], function() glue.emit('telescope.actions.git_status') end, desc = 'Find Git Status' },
      { [[<leader>sg]], function() glue.emit('telescope.actions.grep_string') end, desc = 'Grep String' },
      { [[<leader>sh]], function() glue.emit('telescope.actions.help_tags') end, desc = 'Help Tags' },
      { [[<leader>h]], function() glue.emit('telescope.actions.help_tags') end, desc = 'Help Tags' },
      { [[<leader>sH]], function() glue.emit('telescope.actions.highlights') end, desc = 'Highlights' },
      { [[<leader>sk]], function() glue.emit('telescope.actions.keymaps') end, desc = 'Keymaps' },

      { [[<leader>sl]], function() glue.emit('telescope.actions.buffer_lines') end, desc = 'Buffer Lines' },
      { [[<leader>/]], function() glue.emit('telescope.actions.live_grep') end, desc = 'Live Grep' },
      { [[<leader>sm]], function() glue.emit('telescope.actions.man_pages') end, desc = 'Man Pages' },
      { [[<leader>s']], function() glue.emit('telescope.actions.marks') end, desc = 'Marks' },
      { [[<leader>so]], function() glue.emit('telescope.actions.recent_files') end, desc = 'Recent Files' },
      { [[<leader>sy]], function() glue.emit('telescope.actions.symbols') end, desc = 'Character Symbols' },
      { [[<leader>ss]], function() glue.emit('telescope.actions.tagstack') end, desc = 'Tag Stack' },
      { [[<leader>sT]], function() glue.emit('telescope.actions.telescope') end, desc = 'Telescope ...' },
      { [[<leader>T]], function() glue.emit('telescope.actions.telescope') end, desc = 'Telescope ...' },
      { [[<leader>sv]], function() glue.emit('telescope.actions.vim_options') end, desc = 'Vim Options' },
    },

    -- local actions = require 'telescope.actions'
    opts = {
      defaults = {
        prompt_prefix = ' ',
        selection_caret = ' ',
        border = true,
        layout_strategy = 'flex',
        scroll_strategy = 'cycle',
        mappings = {
          i = {
            ['<esc>'] = function(...) require('telescope.actions').close(...) end,
            ['<C-j>'] = function(...) require('telescope.actions').move_selection_next(...) end,
            ['<C-k>'] = function(...) require('telescope.actions').move_selection_previous(...) end,
          },
        },
      },
      -- extensions = {
      --   -- fzf = {
      --   --   fuzzy = true,
      --   --   override_generic_sorter = true,

      --   --   case_mode = 'smart_case',
      --   -- },
      -- },
      pickers = {
        help_tags = { theme = 'ivy' },
        git_files = { theme = 'ivy' },
        find_files = { theme = 'ivy' },
        commands = { theme = 'ivy' },
        buffers = { theme = 'ivy', sort_lastused = true },
        --   lsp_code_actions = { theme = 'cursor' },
        --   lsp_references = { theme = 'ivy' },
        --   lsp_definitions = { theme = 'ivy' },
        --   lsp_implementations = { theme = 'ivy' },
        --   lsp_document_symbols = { theme = 'cursor', layout_config = { height = 20 } },
        --   aerial = { theme = 'cursor', layout_config = { height = 20 } },
      },
    },

    config = function(_, opts)
      require('telescope').setup(opts)
      require('lib.au').on_colorscheme_changed(
        'telescope-border',
        function()
          vim.cmd([[
          hi! link TelescopeBorder FloatBorder
          hi! link TelescopePromptBorder FloatBorder
          hi! link TelescopeResultsTitle FloatBorder
        ]])
        end
      )

      require('plugins.telescope.actions').start()
    end,
  },
}
