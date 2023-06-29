-- return { 'tpope/vim-surround', opts = {}, } -- https://github.com/tpope/vim-surround
return {
  'echasnovski/mini.surround', -- https://github.com/echasnovski/mini.surround
  version = '*',
  opts = {
    mappings = { add = 'ys', delete = 'ds', replace = 'cs' },
  },
}
