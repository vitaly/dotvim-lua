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

    keys = {
      { [[<leader>att]], _map('telescope.actions.pick'), desc = 'Telescope' },

      { [[<leader>atf]], _map('telescope.actions.pick.file'), desc = 'File' },
      { [[<leader>ato]], _map('telescope.actions.pick.file.recent'), desc = 'Recent Files' },
      { [[<leader>atF]], _map('telescope.actions.pick.file.git'), desc = 'Git File' },

      { [[<leader>atb]], _map('telescope.actions.pick.buffer'), desc = 'Buffer' },

      { [[<leader>at//]], _map('telescope.actions.grep'), desc = 'Grep' },
      { [[<leader>at/w]], _map('telescope.actions.grep.word'), desc = 'Grep Word' },

      { [[<leader>at:]], _map('telescope.actions.pick.history.command'), desc = 'Command History' },

      { [[<leader>atc]], _map('telescope.actions.pick.command'), desc = 'Command' },
      { [[<leader>atC]], _map('telescope.actions.pick.colorscheme'), desc = 'Colorscheme' },
      { [[<leader>atL]], _map('telescope.actions.pick.line.buffer'), desc = 'Buffer Lines' },
      { [[<leader>ata]], _map('telescope.actions.pick.autocommand'), desc = 'Autocommand' },

      { [[<leader>atd]], _map('telescope.actions.pick.diagnostic.buffer'), desc = 'Buffer Diagnostics' },
      { [[<leader>atD]], _map('telescope.actions.pick.diagnostic'), desc = 'Diagnostics' },

      { [[<leader>ath]], _map('telescope.actions.pick.help'), desc = 'Help' },
      { [[<leader>atH]], _map('telescope.actions.pick.highlight'), desc = 'Highlight' },
      { [[<leader>ati]], _map('telescope.actions.pick.icon'), desc = 'Icon' },
      { [[<leader>atk]], _map('telescope.actions.pick.keymap'), desc = 'Keymap' },
      { [[<leader>atm]], _map('telescope.actions.pick.man'), desc = 'Man' },
      { [[<leader>at']], _map('telescope.actions.pick.mark'), desc = 'Mark' },
      { [[<leader>ats]], _map('telescope.actions.pick.tagstack'), desc = 'Tagstack' },
      { [[<leader>atv]], _map('telescope.actions.pick.vim.option'), desc = 'Vim Option' },

      { [[<leader>atGl]], _map('telescope.actions.pick.git.log'), desc = 'Git Log' },
      { [[<leader>atGs]], _map('telescope.actions.pick.git.status'), desc = 'Git Status' },

      { [[<leader>atld]], _map('telescope.lsp.actions.definition'), desc = 'Definition' },
      { [[<leader>atlD]], _map('telescope.lsp.actions.declaration'), desc = 'Declaration' },
      { [[<leader>atlr]], _map('telescope.lsp.actions.reference'), desc = 'References' },
      { [[<leader>atli]], _map('telescope.lsp.actions.implementation'), desc = 'Implementation' },
      { [[<leader>atlt]], _map('telescope.lsp.actions.type.definition'), desc = 'Type Definition' },
      { [[<leader>atlI]], _map('telescope.lsp.actions.call.incoming'), desc = 'Incoming Calls' },
      { [[<leader>atlO]], _map('telescope.lsp.actions.call.outgoing'), desc = 'Outgoing Calls' },
      { [[<leader>atls]], _map('telescope.lsp.actions.symbol.document'), desc = 'Document Symbols' },
      { [[<leader>atlw]], _map('telescope.lsp.actions.symbol.workspace'), desc = 'Workspace Symbols' },
      { [[<leader>atlW]], _map('telescope.lsp.actions.symbol.workspace.dynamic'), desc = 'Dynamic Workspace Symbols' },
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

      require('plugins.telescope.actions').setup()
    end,
  },
}
