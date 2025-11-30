-- modern looking folding with arrows
-- NOTE: The actual status column configuration is in lua/plugins/editor/init.lua
return {
  'kevinhwang91/nvim-ufo', -- https://github.com/kevinhwang91/nvim-ufo#installation

  dependencies = { 'kevinhwang91/promise-async', 'nvim-treesitter/nvim-treesitter' },

  -- NOTE: If BufReadPre is used here, folding fails with an error
  event = { 'BufReadPost', 'BufNewFile' },

  config = function()
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    require('ufo').setup {
      provider_selector = function()
        return { 'treesitter', 'indent' }
      end,
    }

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  end,
}
