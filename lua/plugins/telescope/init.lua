local tools = require 'lib.tools'
local maps = require 'plugins.telescope.maps'
return {
  -------------------------------------------------------------------------------
  -- Telescope
  -------------------------------------------------------------------------------
  {
    'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-symbols.nvim',
    },
    cmd = 'Telescope',

    init = function()
      require('which-key').add { '<leader>s', group = 'Search' }
    end,

    keys = {
      tools.map_keys('<localleader><localleader>', maps.find_files),
      tools.map_keys('<leader>ff', maps.find_files),

      tools.map_keys('<leader>/', maps.live_grep),

      tools.map_keys('<leader><cr>', maps.commands),

      tools.map_keys('<leader>bb', maps.buffers),
      tools.map_keys('<leader>h', maps.help_tags),

      tools.map_keys('<leader>s:', maps.command_history),

      tools.map_keys('<leader>sT', maps.telescope),
      tools.map_keys('<leader>sC', maps.colorschemes),
      tools.map_keys('<leader>sH', maps.highlights),

      tools.map_keys('<leader>sD', maps.diagnostics),
      tools.map_keys('<leader>sa', maps.autocommands),
      tools.map_keys('<leader>sb', maps.buffers),
      tools.map_keys('<leader>sc', maps.commands),
      tools.map_keys('<leader>sd', maps.buf_diagnostics),
      tools.map_keys('<leader>sg', maps.grep_string),
      tools.map_keys('<leader>sh', maps.help_tags),
      tools.map_keys('<leader>sk', maps.keymaps),
      tools.map_keys('<leader>sl', maps.lines),
      tools.map_keys('<leader>sm', maps.man_pages),
      tools.map_keys('<leader>so', maps.recent_fies),
      tools.map_keys('<leader>sy', maps.symbols),
      tools.map_keys('<leader>ss', maps.tagstack),
      tools.map_keys('<leader>sv', maps.vim_options),

      tools.map_keys("<leader>s'", maps.marks),

      tools.map_keys('<leader>gf', maps.git_files),
      tools.map_keys('<leader>gc', maps.git_commits),
      tools.map_keys('<leader>gS', maps.git_status),
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
            -- stylua: ignore start
            ['<esc>'] = function(...) require('telescope.actions').close(...) end,
            ['<C-j>'] = function(...) require('telescope.actions').move_selection_next(...) end,
            ['<C-k>'] = function(...) require('telescope.actions').move_selection_previous(...) end,
            -- stylua: ignore end
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
      require('lib.au').on_colorscheme_changed('telescope-border', function()
        vim.cmd [[
          hi! link TelescopeBorder FloatBorder
          hi! link TelescopePromptBorder FloatBorder
          hi! link TelescopeResultsTitle FloatBorder
        ]]
      end)
    end,
  },
}
