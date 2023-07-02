return {

  -------------------------------------------------------------------------------
  -- MASON - generic installer
  {
    'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim
    lazy = true,
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    cmd = { 'Mason', 'MasonLog', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll' },
    init = function()
      require('lib.tools').keymap_group([[<leader>am]], 'Mason')
    end,
    keys = {
      { [[<leader>Sm]], vim.cmd.Mason, desc = 'Mason' }, -- Status

      { [[<leader>amm]], vim.cmd.Mason, desc = 'Mason' },
      { [[<leader>aml]], vim.cmd.MasonLog, desc = 'Mason Log' },
      { [[<leader>amu]], vim.cmd.MasonUpdate, desc = 'Mason Update' },
      { [[<leader>ami]], [[:<c-u>MasonInstall ]], desc = 'Mason Install...' },
    },
    config = true,
  },
}
