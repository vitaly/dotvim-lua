return {
  -------------------------------------------------------------------------------
  -- Telescope
  -------------------------------------------------------------------------------
  {
    'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
    lazy = true,
    dependencies = {
      'vitaly/glue.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-symbols.nvim',
    },
    cmd = 'Telescope',

    init = function()
      require('which-key').add({
        { [[<leader>at]], group = '[T]elescope' },
        { [[<leader>at/]], group = 'Grep' },
        { [[<leader>atG]], group = 'Git' },
        { [[<leader>atl]], group = 'LSP' },
      })
    end,

    keys = require('plugins.telescope.keys'),

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

      require('plugins.telescope.actions').setup()
    end,
  },
}
