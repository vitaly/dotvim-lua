-- return { 'tpope/vim-surround', opts = {}, } -- https://github.com/tpope/vim-surround
return {
  'echasnovski/mini.surround', -- https://github.com/echasnovski/mini.surround
  version = '*',
  opts = {
    mappings = { add = 'ys', add_visual = 'S', delete = 'ds', replace = 'cs' },
  },
  config = function(_, opts)
    require('mini.surround').setup(opts)
    vim.keymap.del('x', opts.mappings.add)
    vim.keymap.set('x', opts.mappings.add_visual, [[:<c-u>lua MiniSurround.add('visual')<cr>]], { silent = true, desc = 'Add surrounding to selection' })
  end,
}
