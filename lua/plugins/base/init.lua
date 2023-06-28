return {
  -- manage lazy itself. use the latest STABLE version
  {
    'folke/lazy.nvim',
    version = '*',
    keys = {
      { '<leader>azz', '<cmd>Lazy home<cr>', desc = 'Home' },
      { '<leader>azs', '<cmd>Lazy sync<cr>', desc = 'Sync' },
      { '<leader>azb', '<cmd>Lazy build<cr>', desc = 'Build' },
      { '<leader>azk', '<cmd>Lazy check<cr>', desc = 'Check' },
      { '<leader>azl', '<cmd>Lazy log<cr>', desc = 'Log' },
      { '<leader>azC', '<cmd>Lazy clear<cr>', desc = 'Clear' },
      { '<leader>azd', '<cmd>Lazy debug<cr>', desc = 'Debug' },
      { '<leader>azr', ':<c-u>Lazy reload ', desc = 'Reload...' },
      { '<leader>azL', ':<c-u>Lazy load ', desc = 'Load...' },
      { '<leader>azR', '<cmd>Lazy restore<cr>', desc = 'Restore' },
      { '<leader>azp', '<cmd>Lazy profile<cr>', desc = 'Profile' },
      { '<leader>azh', '<cmd>Lazy health<cr>', desc = 'Health' },

      { '<leader>sz', '<cmd>Lazy Check<cr>', desc = 'Lazy' },
    },
  },
  { 'folke/which-key.nvim', opts = { register = { ['<leader>az'] = { name = 'Lazy' } } } }, -- register menu group
}
