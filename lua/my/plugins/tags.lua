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
  setup = function()
    vim.g.symbols_outline = {
      auto_preview = false,
      show_numbers = false,
      -- show_relative_numbers = true,
      width = 30,
      keymaps = {
        close = { 'q' },
      },
    }

    vim.cmd [[
      augroup outline_setup
      autocmd!
      autocmd FileType Outline set foldcolumn=0 | set signcolumn=auto
      augroup end
      hi! clear FocusedSymbol
      hi! FocusedSymbol gui=bold guifg=red
    ]]

    map('<plug>Toggle(Tagbar)', '<cmd>SymbolsOutline<cr>')
    nmap('<leader>TT', '<plug>Toggle(Tagbar)')
  end,
}
