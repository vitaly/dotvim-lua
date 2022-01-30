-- return {
--   'liuchengxu/vista.vim',
--   config = function()
--     vim.g.vista_default_executive = 'nvim_lsp'
--     -- vim.g.vista_echo_cursor_strategy = 'floating_win'
--     vim.g.vista_highlight_whole_line = 1
--     vim.g.vista_stay_on_open = 0
--     vim.g.vista_disable_statusline = 1
--     map('<plug>Toggle(Tagbar)', '<cmd>Vista!!<cr>')
--     nmap('<leader>TT', '<plug>Toggle(Tagbar)')
--   end,
-- }

return {
  'simrat39/symbols-outline.nvim', -- https://github.com/simrat39/symbols-outline.nvim

  cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },

  setup = function()
    vim.g.symbols_outline = {
      position = 'left',
      auto_preview = false,
      show_numbers = false,
      -- show_relative_numbers = true,
      width = 40,
      keymaps = {
        close = { 'q' },
        goto_location = { '<Cr>', '<2-LeftMouse>' },
      },
    }

    -- vim.cmd [[
    --   augroup outline_setup
    --   autocmd!
    --   autocmd FileType Outline set foldcolumn=0 | set signcolumn=auto
    --   augroup end
    --   hi! clear FocusedSymbol
    --   hi! FocusedSymbol gui=bold guifg=red
    -- ]]

    require('which-key').register {
      ['\\'] = {
        t = { '<cmd>SymbolsOutline<cr>', 'Toggle TagBar' },
      },
    }
  end,
}

-- return {
--   'sidebar-nvim/sidebar.nvim', -- https://github.com/sidebar-nvim/sidebar.nvim

--   config = function()
--     require('sidebar-nvim').setup {
--       -- disable_default_keybindings = 0,
--       -- bindings = nil,
--       -- open = false,
--       open = true,
--       -- side = 'left',
--       -- initial_width = 35,
--       -- hide_statusline = false,
--       hide_statusline = true,
--       -- update_interval = 1000,
--       -- sections = { 'datetime', 'git', 'diagnostics' },
--       sections = { 'symbols', 'git', 'todos', 'buffers', 'diagnostics' },
--       -- section_separator = { '', '-----', '' },
--       -- containers = {
--       --   attach_shell = '/bin/sh',
--       --   show_all = true,
--       --   interval = 5000,
--       -- },
--       -- datetime = { format = '%a %b %d, %H:%M', clocks = { { name = 'local' } } },
--       -- todos = { ignored_paths = { '~' } },
--       -- disable_closing_prompt = false,
--     }
--   end,
-- }
