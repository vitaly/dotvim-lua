return {
  'folke/snacks.nvim',
  dependencies = {
    'onion.nvim',
    {
      'folke/todo-comments.nvim', -- https://github.com/folke/todo-comments.nvim
      dependencies = { 'nvim-lua/plenary.nvim' },
      opts = {
        keywords = {
          TODO = { icon = ' ', color = 'info', alt = { 'TBD' } },
        },
      },
    },
  },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config

  init = function()
    require('which-key').add({
      { [[<leader>as]], group = '[S]nacks' },
      { [[<leader>as/]], group = 'Grep' },
      { [[<leader>asG]], group = 'Git' },
      { [[<leader>asl]], group = 'LSP' },
    })
  end,

  keys = require('plugins.snacks.keys'),

  config = function()
    local conf = require('onion.config')
    conf.set_defaults('snacks.setup', {
      bigfile = { enabled = true },
      debug = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = false },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    })

    ---@type snacks.Config
    local opts = vim.tbl_deep_extend('force', {
      picker = {
        win = {
          input = {

            keys = {
              ['<esc>'] = { 'close', mode = { 'n', 'i' } }, -- This makes <Esc> always close the picker window.
            },
          },
        },
      },
      dashboard = {
        sections = {
          { section = 'header' },
          { section = 'keys', indent = 0, padding = 2, gap = 1 },
          { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 2, gap = 1 },
          { section = 'startup' },
        },
      },
      scratch = {
        ft = function()
          if vim.bo.buftype == '' and vim.bo.filetype ~= '' then return vim.bo.filetype end
          return 'lua'
        end,
      },
    }, conf.get('snacks.setup'))

    -- print('opts.notifier', vim.inspect(opts.notifier))

    require('snacks').setup(opts)
    require('plugins.snacks.actions').setup()
  end,
}
