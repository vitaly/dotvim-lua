-- https://github.com/nvim-neorg/neorg
return {
  'nvim-neorg/neorg',
  branch = 'unstable',
  requires = { 'nvim-lua/plenary.nvim', 'nvim-neorg/neorg-telescope', 'nvim-telescope/telescope.nvim' },

  config = function()
    -- print 'NORG CONFIG'
    require('neorg').setup {
      -- Tell Neorg what modules to load
      load = {
        ['core.defaults'] = {}, -- Load all the default modules

        ['core.norg.concealer'] = {
          config = {
            icons = {
              todo = {
                undone = {
                  icon = ' ',
                },
              },
            },
          },
        }, -- Allows for use of icons

        ['core.norg.dirman'] = { -- Manage your directories with Neorg
          config = {
            workspaces = {
              main = '~/Documents/neorg/gtd',
            },
          },
        },

        ['core.keybinds'] = { -- Configure core.keybinds
          config = {
            default_keybinds = false, -- Generate the default keybinds
            -- neorg_leader = '<Leader>o', -- This is the default if unspecified
          },
        },

        ['core.norg.completion'] = {
          config = { engine = 'nvim-cmp' },
        },

        ['core.integrations.telescope'] = {}, -- Enable the telescope module

        ['core.gtd.base'] = {
          config = {
            workspace = 'main',
          },
        },
      },
    }

    local neorg_callbacks = require 'neorg.callbacks'
    local neorg_leader = '<leader>o'

    neorg_callbacks.on_event('core.keybinds.events.enable_keybinds', function(_, keybinds)
      -- Map all the below keybinds only when the "norg" mode is active
      keybinds.map_event_to_mode('norg', {
        n = { -- Bind keys in normal mode

          -- Keys for managing TODO items and setting their states
          -- { 'gtd', 'core.norg.qol.todo_items.todo.task_done' },
          -- { 'gtu', 'core.norg.qol.todo_items.todo.task_undone' },
          -- { 'gtp', 'core.norg.qol.todo_items.todo.task_pending' },
          { '<C-Space>', 'core.norg.qol.todo_items.todo.task_cycle' },

          -- Keys for managing GTD
          -- { neorg_leader .. 'tc', 'core.gtd.base.capture' },
          -- { neorg_leader .. 'tv', 'core.gtd.base.views' },
          { neorg_leader .. 'te', 'core.gtd.base.edit' },

          -- Keys for managing notes
          -- { neorg_leader .. 'nn', 'core.norg.dirman.new.note' },

          { '<CR>', 'core.norg.esupports.goto_link' },

          { '<C-s>', 'core.integrations.telescope.find_linkable' },

          -- { '<M-k>', 'core.norg.manoeuvre.item_up' },
          -- { '<M-j>', 'core.norg.manoeuvre.item_down' },
        },

        i = {
          { '<C-l>', 'core.integrations.telescope.insert_link' },
        },

        o = {
          { 'ah', 'core.norg.manoeuvre.textobject.around-heading' },
          { 'ih', 'core.norg.manoeuvre.textobject.inner-heading' },
          { 'at', 'core.norg.manoeuvre.textobject.around-tag' },
          { 'it', 'core.norg.manoeuvre.textobject.inner-tag' },
          { 'al', 'core.norg.manoeuvre.textobject.around-whole-list' },
        },
      }, {
        silent = true,
        noremap = true,
      })

      -- Map the below keys only when traverse-heading mode is active
      keybinds.map_event_to_mode('traverse-heading', {
        n = {
          -- Rebind j and k to move between headings in traverse-heading mode
          { 'j', 'core.integrations.treesitter.next.heading' },
          { 'k', 'core.integrations.treesitter.previous.heading' },
        },
      }, {
        silent = true,
        noremap = true,
      })

      -- Map the below keys on gtd displays
      keybinds.map_event_to_mode('gtd-displays', {
        n = {
          { '<CR>', 'core.gtd.ui.goto_task' },

          -- Keys for closing the current display
          { 'q', 'core.gtd.ui.close' },
          { '<Esc>', 'core.gtd.ui.close' },

          { 'e', 'core.gtd.ui.edit_task' },
          { '<Tab>', 'core.gtd.ui.details' },
        },
      }, {
        silent = true,
        noremap = true,
        nowait = true,
      })

      -- Map the below keys on presenter mode
      keybinds.map_event_to_mode('presenter', {
        n = {
          { '<CR>', 'core.presenter.next_page' },
          { 'l', 'core.presenter.next_page' },
          { 'h', 'core.presenter.previous_page' },

          -- Keys for closing the current display
          { 'q', 'core.presenter.close' },
          { '<Esc>', 'core.presenter.close' },
        },
      }, {
        silent = true,
        noremap = true,
        nowait = true,
      })
      -- Apply the below keys to all modes
      keybinds.map_to_mode('all', {
        n = {
          { neorg_leader .. 'mn', ':Neorg mode norg<CR>' },
          { neorg_leader .. 'mh', ':Neorg mode traverse-heading<CR>' },
        },
      }, {
        silent = true,
        noremap = true,
      })

      require('which-key').register({
        [neorg_leader] = {
          m = {
            name = 'Mode',
          },

          te = 'Edit task',
        },
      }, { buffer = 0 })
    end)

    require('which-key').register {
      [neorg_leader] = {
        name = 'NeOrg',

        n = {
          name = 'New',
          n = { '<cmd>Neorg keybind all core.norg.dirman.new.note<cr>', 'Note' },
        },

        t = {
          name = 'Todo',
          c = { '<cmd>Neorg gtd capture<cr>', 'Capture' },
          v = { '<cmd>Neorg gtd views<cr>', 'Views' },
        },
      },
    }
  end,
}
