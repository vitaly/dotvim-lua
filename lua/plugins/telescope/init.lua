local map_keys = require('lib.tools').map_keys
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
      require('lib.tools').keymap_group([[<leader>s]], 'Search')
    end,

    keys = {
      map_keys(maps.find_files, [[<localleader><localleader>]]),
      map_keys(maps.find_files, [[<leader>ff]]),

      map_keys(maps.live_grep, [[<leader>/]]),

      map_keys(maps.commands, [[<leader><cr>]]),

      map_keys(maps.buffers, [[<leader>bb]]),
      map_keys(maps.help_tags, [[<leader>h]]),

      map_keys(maps.command_history, [[<leader>s:]]),

      map_keys(maps.telescope, [[<leader>sT]]),
      map_keys(maps.colorschemes, [[<leader>sC]]),
      map_keys(maps.highlights, [[<leader>sH]]),

      map_keys(maps.diagnostics, [[<leader>sD]]),
      map_keys(maps.autocommands, [[<leader>sa]]),
      map_keys(maps.buffers, [[<leader>sb]]),
      map_keys(maps.commands, [[<leader>sc]]),
      map_keys(maps.buf_diagnostics, [[<leader>sd]]),
      map_keys(maps.grep_string, [[<leader>sg]]),
      map_keys(maps.help_tags, [[<leader>sh]]),
      map_keys(maps.keymaps, [[<leader>sk]]),
      map_keys(maps.lines, [[<leader>sl]]),
      map_keys(maps.man_pages, [[<leader>sm]]),
      map_keys(maps.recent_fies, [[<leader>so]]),
      map_keys(maps.symbols, [[<leader>sy]]),
      map_keys(maps.tagstack, [[<leader>ss]]),
      map_keys(maps.vim_options, [[<leader>sv]]),

      map_keys(maps.marks, [[<leader>s']]),

      map_keys(maps.git_files, [[<leader>gf]]),
      map_keys(maps.git_commits, [[<leader>gc]]),
      map_keys(maps.git_status, [[<leader>gS]]),
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
