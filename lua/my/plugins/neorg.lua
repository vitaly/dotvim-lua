-- https://github.com/nvim-neorg/neorg
return {
  'nvim-neorg/neorg',
  -- branch = 'unstable',
  branch = 'main',
  requires = { 'nvim-lua/plenary.nvim', 'nvim-neorg/neorg-telescope', 'nvim-telescope/telescope.nvim' },
  config = function()
    -- global mapping to start Neorg
    require('which-key').register {
      ['<leader>o'] = {
        function()
          vim.cmd [[
            unmap <leader>o
            silent! NeorgStart
          ]]
        end,
        'Neorg Start',
      },
    } -- /register

    require('neorg').setup {
      -- HOOK start
      hook = function()
        -- here Neorg already started
        -- so we can remove the start mapping and replace it with GLOBAL neorg menu
        vim.cmd 'silent! unmap <leader>o'
        -- this is GLOBAL
        require('which-key').register {
          ['<leader>o'] = {
            name = 'NeOrg',

            n = { '<cmd>Neorg keybind all core.norg.dirman.new.note<cr>', 'New Note' },
            f = { '<cmd>Neorg keybind all core.integrations.telescope.find_linkable<cr>', 'Find' },

            c = { '<cmd>Neorg gtd capture<cr>', 'Capture' },
            v = { '<cmd>Neorg gtd views<cr>', 'Views' },
          }, -- /<leader>o
        } -- /register

        require('neorg.callbacks').on_event('core.keybinds.events.enable_keybinds', function(_, keybinds)
          -- here we are inside neorg buffer, ready to setup bindings

          -- Map all the below keybinds only when the "norg" mode is active
          keybinds.map_event_to_mode('norg', {
            n = {

              -- Keys for managing TODO items and setting their states
              { '<localleader>tu', 'core.norg.qol.todo_items.todo.task_undone' },
              { '<localleader>tp', 'core.norg.qol.todo_items.todo.task_pending' },
              { '<localleader>td', 'core.norg.qol.todo_items.todo.task_done' },
              { '<localleader>th', 'core.norg.qol.todo_items.todo.task_on_hold' },
              { '<localleader>tc', 'core.norg.qol.todo_items.todo.task_cancelled' },
              { '<localleader>tr', 'core.norg.qol.todo_items.todo.task_recurring' },
              { '<localleader>ti', 'core.norg.qol.todo_items.todo.task_important' },
              --
              { '<C-Space>', 'core.norg.qol.todo_items.todo.task_cycle' },

              -- Keys for managing GTD
              -- defined globally
              -- { '<leader>oc', 'core.gtd.base.capture' },
              -- defined globally
              -- { '<leader>ov', 'core.gtd.base.views' },
              { '<localleader>te', 'core.gtd.base.edit' },

              -- Keys for managing notes
              -- defined globally
              -- { neorg_leader .. "nn", "core.norg.dirman.new.note" },

              { '<CR>', 'core.norg.esupports.hop.hop-link' },
              { '<M-CR>', 'core.norg.esupports.hop.hop-link', 'vsplit' },

              -- { "<M-k>", "core.norg.manoeuvre.item_up" },
              -- { "<M-j>", "core.norg.manoeuvre.item_down" },
            },

            i = {
              { '<C-s>', 'core.integrations.telescope.insert_link' },
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
              { '<leader>omn', ':Neorg mode norg<CR>' },
              { '<leader>omh', ':Neorg mode traverse-heading<CR>' },
            },
          }, {
            silent = true,
            noremap = true,
          })

          require('which-key').register({
            ['<leader>o'] = {
              m = {
                name = 'Mode',
              },
            },

            ['<localleader>t'] = {
              name = 'Task',
              e = 'Edit',
              u = 'Undone',
              p = 'Pending',
              d = 'Done',
              h = 'Hold',
              c = 'Cancel',
              r = 'Recurring',
              i = 'Important',
            },
          }, { buffer = 0 }) -- /register
        end) -- /on_event enable_keybinds
      end, -- /hook

      -- Tell Neorg what modules to load
      load = {
        ['core.defaults'] = {}, -- Load all the default modules

        -- CONCEALER
        ['core.norg.concealer'] = {
          config = {
            icons = {
              todo = {
                undone = {
                  enabled = false,
                },
              },
            },
          },
        }, -- Allows for use of icons

        -- DIRMAN
        ['core.norg.dirman'] = { -- Manage your directories with Neorg
          config = {
            workspaces = {
              main = '~/Documents/neorg/gtd',
            },
          },
        },

        -- KEYBINDINGS
        ['core.keybinds'] = { -- Configure core.keybinds
          config = {
            default_keybinds = false, -- Generate the default keybinds
            neorg_leader = '<Leader>o', -- This is the default if unspecified
          },
        },

        -- COMPLETION
        ['core.norg.completion'] = {
          config = { engine = 'nvim-cmp' },
        },

        -- TELESCOPE
        ['core.integrations.telescope'] = {}, -- Enable the telescope module

        -- GTD
        ['core.gtd.base'] = {
          config = {
            workspace = 'main',
            default_lists = {
              inbox = 'in.norg',
            },
          },
        },
      }, -- /load=
    } -- /setup()
  end, -- /config=
}
