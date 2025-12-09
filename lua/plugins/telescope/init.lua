local glue = require('glue').register('telescope')

local function _map(event)
  return function() return glue.call(event) end
end

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
      { [[<leader>ap]], _map('telescope.actions.telescope'), desc = 'telesco[P]e' },

      { [[<leader>sd]], _map('telescope.actions.buffer_diagnostics'), desc = 'Buffer Diagnostics' },
      { [[<leader>sa]], _map('telescope.actions.autocommands'), desc = 'Autocommands' },
      { [[<leader>bb]], _map('telescope.actions.buffers'), desc = 'Find buffer' },
      { [[<leader>sb]], _map('telescope.actions.buffers'), desc = 'Find buffer' },
      { [[<leader>sC]], _map('telescope.actions.colorscheme'), desc = 'Find Colorscheme' },
      { [[<leader>s:]], _map('telescope.actions.command_history'), desc = 'Command History' },
      { [[<leader><cr>]], _map('telescope.actions.commands'), desc = 'Find Command' },
      { [[<leader>sc]], _map('telescope.actions.commands'), desc = 'Find Command' },
      { [[<leader>sD]], _map('telescope.actions.diagnostics'), desc = 'Diagnostics' },
      { [[<leader>ff]], _map('telescope.actions.find_files'), desc = 'Find File' },
      { [[<localleader><localleader>]], _map('telescope.actions.find_files'), desc = 'Find File' },
      { [[<leader>gc]], _map('telescope.actions.git_commits'), desc = 'Find Git Commit' },
      { [[<leader>gf]], _map('telescope.actions.git_files'), desc = 'Find Git File' },
      { [[<leader>gS]], _map('telescope.actions.git_status'), desc = 'Find Git Status' },
      { [[<leader>sg]], _map('telescope.actions.grep_string'), desc = 'Grep String' },
      { [[<leader>sh]], _map('telescope.actions.help_tags'), desc = 'Help Tags' },
      { [[<leader>h]], _map('telescope.actions.help_tags'), desc = 'Help Tags' },
      { [[<leader>sH]], _map('telescope.actions.highlights'), desc = 'Highlights' },
      { [[<leader>sk]], _map('telescope.actions.keymaps'), desc = 'Keymaps' },

      { [[<leader>sl]], _map('telescope.actions.buffer_lines'), desc = 'Buffer Lines' },
      { [[<leader>/]], _map('telescope.actions.live_grep'), desc = 'Live Grep' },
      { [[<leader>sm]], _map('telescope.actions.man_pages'), desc = 'Man Pages' },
      { [[<leader>s']], _map('telescope.actions.marks'), desc = 'Marks' },
      { [[<leader>so]], _map('telescope.actions.recent_files'), desc = 'Recent Files' },
      { [[<leader>sy]], _map('telescope.actions.symbols'), desc = 'Character Symbols' },
      { [[<leader>ss]], _map('telescope.actions.tagstack'), desc = 'Tag Stack' },
      { [[<leader>sT]], _map('telescope.actions.telescope'), desc = 'Telescope ...' },
      { [[<leader>T]], _map('telescope.actions.telescope'), desc = 'Telescope ...' },
      { [[<leader>sv]], _map('telescope.actions.vim_options'), desc = 'Vim Options' },
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
