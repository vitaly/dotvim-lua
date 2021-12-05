-- https://github.com/nvim-neorg/neorg
return {
  'nvim-neorg/neorg',
  requires = 'nvim-lua/plenary.nvim',
  config = function()
    print 'NORG CONFIG'
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

    local neorg_callbacks = require 'neorg.callbacks'

    neorg_callbacks.on_event('core.keybinds.events.enable_keybinds', function(_, keybinds)
      -- Map all the below keybinds only when the "norg" mode is active
      print 'NORG CONFIG MAPS'
      keybinds.map_event_to_mode('norg', {
        n = { -- Bind keys in normal mode

          -- Keys for managing TODO items and setting their states
          { '<localleader>td', 'core.norg.qol.todo_items.todo.task_done' },
          { '<localleader>tu', 'core.norg.qol.todo_items.todo.task_undone' },
          { '<localleader>tp', 'core.norg.qol.todo_items.todo.task_pending' },
          { '<localleader>tc', 'core.norg.qol.todo_items.todo.task_cycle' },
          { '<C-Space>', 'core.norg.qol.todo_items.todo.task_cycle' },
        },
      }, { silent = true, noremap = true })
    end)

    require('which-key').register {
      ['<localleader>t'] = {
        name = 'TODO',
        x = { '<Cmd>Neorg keybind norg core.norg.qol.todo_items.todo.task_cycle<CR>', 'Cycle' },
      },
    }

    -- require('which-key').register {
    --   ['<leader>o'] = {
    --     name = 'NeOrg',

    --     m = {
    --       name = 'Mode',
    --     },
    --   },
    --   ['<localleader>t'] = {
    --     name = 'Todo',

    --     d = {
    --       name = 'Done',
    --     },
    --     u = {
    --       name = 'Undone',
    --     },
    --     p = {
    --       name = 'Pending',
    --     },
    --     c = {
    --       name = 'Cycle',
    --     },
    --   },
    -- }
  end,
}
