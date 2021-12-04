-- https://github.com/nvim-neorg/neorg
return {
  'nvim-neorg/neorg',
  requires = 'nvim-lua/plenary.nvim',
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
        -- ['core.keybinds'] = { -- Configure core.keybinds
        --   config = {
        --     default_keybinds = true, -- Generate the default keybinds
        --     neorg_leader = '<Leader>o', -- This is the default if unspecified
        --   },
        -- },
        ['core.norg.completion'] = {
          config = { engine = 'nvim-cmp' },
        },
      },
    }

    require('which-key').register {
      ['<leader>o'] = {
        name = 'NeOrg',

        m = {
          name = 'Mode',
        },
      },
    }
  end,
}
