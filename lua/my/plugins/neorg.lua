-- https://github.com/nvim-neorg/neorg
return {
  'nvim-neorg/neorg',
  config = function()
    require('neorg').setup {
      -- Tell Neorg what modules to load
      load = {
        ['core.defaults'] = {}, -- Load all the default modules
        ['core.norg.concealer'] = {}, -- Allows for use of icons
        ['core.norg.dirman'] = { -- Manage your directories with Neorg
          config = {
            workspaces = {
              my_workspace = '~/Documents/neorg',
            },
          },
        },
      },
    }
  end,
  requires = 'nvim-lua/plenary.nvim',
}
