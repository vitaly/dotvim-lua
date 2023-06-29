return {
  'echasnovski/mini.comment', -- https://github.com/echasnovski/mini.comment
  version = '*',
  keys = {
    { [[gc]], mode = { 'o', 'x', 'n' } },
    { [[\;]], 'gcc', remap = true, desc = 'Comment toggle' },
    { [[\;]], 'gc', mode = 'x', remap = true, desc = 'Comment toggle' },
  },
  opts = {},
}
