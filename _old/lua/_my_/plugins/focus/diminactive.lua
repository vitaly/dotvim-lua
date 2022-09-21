return {
  'blueyed/vim-diminactive', -- https://github.com/blueyed/vim-diminactive

  setup = function()
    vim.g.diminactive_use_colorcolumn = 1
    vim.g.diminactive_use_syntax = 0
  end,

  config = function()
    noremap('<plug>Toggle(diminactive)', function()
      vim.cmd [[DimInactiveToggle]]
    end)

    nmap('<leader>Td', '<plug>Toggle(diminactive)')
  end,
}
