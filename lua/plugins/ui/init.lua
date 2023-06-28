local function telescope(cmd)
  return '<cmd>Telescope ' .. cmd .. '<cr>'
end
return {
  -------------------------------------------------------------------------------
  -- Telescope
  -------------------------------------------------------------------------------
  { 'folke/which-key.nvim', opts = { register = {
    ['<leader>s'] = { name = 'Search' },
  } } }, -- register menu group
  {
    'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',

    keys = {
      { '<localleader><localleader>', telescope [[find_files]], desc = 'Find File' },
      { '<leader>ff', telescope [[find_files]], desc = 'Find File' },

      { [[<leader>/]], telescope [[live_grep]], desc = 'Live Grep' },

      { [[<leader><cr>]], telescope [[commands]], desc = 'Find Command' },

      { [[<leader>bb]], telescope [[buffers]], desc = 'Find buffer' },
      { [[<leader>h]], telescope [[help_tags]], desc = 'Help Tags' },

      { [[<leader>s:]], telescope [[command_history]], desc = 'Command History' },

      { [[<leader>sT]], telescope [[]], desc = 'Telescope' },
      { [[<leader>sC]], telescope [[colorscheme enable_preview=true]], desc = 'Colorscheme +preview' },

      { [[<leader>sD]], telescope [[diagnostics]], desc = 'Diagnostics' },
      { [[<leader>sa]], telescope [[autocommands]], desc = 'Autocommands' },
      { [[<leader>sb]], telescope [[buffers]], desc = 'Find buffer' },
      { [[<leader>sc]], telescope [[commands]], desc = 'Find Command' },
      { [[<leader>sd]], telescope [[diagnostics buffnr=0]], desc = 'Document Diagnostics' },
      { [[<leader>sg]], telescope [[grep_string]], desc = 'Grep String' },
      { [[<leader>sh]], telescope [[help_tags]], desc = 'Help Tags' },
      { [[<leader>sk]], telescope [[keymaps]], desc = 'Keymaps' },
      { [[<leader>sl]], telescope [[current_buffer_fuzzy_find]], desc = 'Current Buffer Lines' },
      { [[<leader>sm]], telescope [[man_pages]], desc = 'Manpages' },
      { [[<leader>so]], telescope [[oldfiles]], desc = 'Recent Files' },
      { [[<leader>ss]], telescope [[symbols]], desc = 'Character Symbols' },
      { [[<leader>st]], telescope [[tagstack]], desc = 'Tagstack' },
      { [[<leader>sv]], telescope [[vim_options]], desc = 'Vim Options' },

      { [[<leader>s']], telescope [[marks]], desc = 'Marks' },

      { [[<leader>gf]], telescope [[git_files]], desc = 'Git Files' },
      { [[<leader>gc]], telescope [[git_commits]], desc = 'Git Commits' },
      { [[<leader>gS]], telescope [[git_status]], desc = 'Search Git Status' },
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
