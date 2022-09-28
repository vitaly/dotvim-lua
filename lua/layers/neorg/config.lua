return {
  config = function()
    require('neorg').setup {
      lazy_loading = true,
      load = {
        ['core.defaults'] = {},

        ---------------------------------------------------------------------------------
        -- SETUP WORKSPACE
        ---------------------------------------------------------------------------------
        ['core.norg.dirman'] = {
          config = {
            workspaces = {
              main = '~/Documents/neorg/gtd',
            },
          },
        },

        ---------------------------------------------------------------------------------
        -- CONCEALER
        ---------------------------------------------------------------------------------
        ['core.norg.concealer'] = {
          config = { -- Note that this table is optional and doesn't need to be provided
            icons = {
              todo = {
                undone = {
                  enabled = false,
                },
              },
            },
          },
        },

        ---------------------------------------------------------------------------------
        -- COMPLETION
        ---------------------------------------------------------------------------------
        ['core.norg.completion'] = {
          config = { engine = 'nvim-cmp' },
        },

        ---------------------------------------------------------------------------------
        -- TELESCOPE
        ['core.integrations.telescope'] = {}, -- Enable the telescope module

        ---------------------------------------------------------------------------------
        -- GTD
        ---------------------------------------------------------------------------------
        ['core.gtd.base'] = {
          config = {
            workspace = 'main',
            default_lists = {
              inbox = 'in.norg',
            },
          },
        },

        ['core.keybinds'] = {
          config = {
            hook = function(keybinds)
              -- here Neorg already started
              -- so we can remove the start mapping and replace it with GLOBAL neorg menu
              vim.cmd 'silent! unmap <leader>o'

              --            keybinds.unmap('norg', 'i', '<C-s>')
              --            keybinds.remap_key('norg', 'i', '<C-l>', '<C-s>')

              --            -- this is GLOBAL
              --            require('which-key').register {
              --            ['<leader>o'] = {
              --              name = 'NeOrg',

              --              c = { '<cmd>Neorg keybind all core.gtd.base.capture<cr>', 'Capture' },
              --              v = { '<cmd>Neorg keybind all core.gtd.base.views<cr>', 'Views' },
              --              n = { '<cmd>Neorg keybind all core.norg.dirman.new.note<cr>', 'New Note' },
              --            }, -- /<leader>o
              --            } -- /register global

              --            require('which-key').register({
              --            gt = {
              --              name = 'TODO',

              --              r = { 'Reccurring' },
              --              h = { 'Hold' },
              --              c = { 'cancelled' },
              --              p = { 'pending' },
              --              i = { 'important' },
              --              u = { 'Undone' },
              --              d = { 'Done' },
              --            },

              --            ['<localleader>t'] = {
              --              name = 'GTD',

              --              c = { 'Capture' },
              --              e = { 'Edit' },
              --              v = { 'Views' }
              --            },

              --            ['<localleader>m'] = {
              --              name = 'Neorg Mode',
              --            },
              --            }, { buffer = 0 }) -- /register buffer
            end,
          },
        },
      }, -- load

      -- global mapping to start Neorg
      require('which-key').register {
        ['<leader>o'] = {
          function()
            vim.cmd [[
              unmap <leader>o
              NeorgStart
            ]]
          end,
          'Neorg Start',
        },
      }, -- /register
    }
  end,
}
