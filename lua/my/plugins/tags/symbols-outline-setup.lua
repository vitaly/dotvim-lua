-- vim.g.symbols_outline = {
--   position = 'left',
--   auto_preview = false,
--   show_numbers = false,
--   -- show_relative_numbers = true,
--   width = 40,
--   keymaps = {
--     close = { 'q' },
--     goto_location = { '<Cr>', '<2-LeftMouse>' },
--   },
-- }

-- -- vim.cmd [[
-- --   augroup outline_setup
-- --   autocmd!
-- --   autocmd FileType Outline set foldcolumn=0 | set signcolumn=auto
-- --   augroup end
-- --   hi! clear FocusedSymbol
-- --   hi! FocusedSymbol gui=bold guifg=red
-- -- ]]

-- require('which-key').register {
--   ['\\'] = {
--     t = { '<cmd>SymbolsOutline<cr>', 'Toggle TagBar' },
--   },
-- }
return {
  'simrat39/symbols-outline.nvim', -- https://github.com/simrat39/symbols-outline.nvim

  -- cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },

  config = function()
    require("symbols-outline").setup({
      keymaps = {
        goto_location = { '<Cr>', '<2-LeftMouse>' },
      },
    })

    require('which-key').register {
      ['\\'] = {
        t = { '<cmd>SymbolsOutline<cr>', 'TagBar' },
      },
    }
  end,
}

