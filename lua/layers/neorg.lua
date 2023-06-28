-- lua/layers/neorg.lua

return {
  'nvim-neorg/neorg', -- https://github.com/nvim-neorg/neorg
  -- branch = 'unstable',
  branch = 'main',

  after = { 'nvim-treesitter', 'telescope.nvim' },

  requires = {
    'nvim-neorg/neorg-telescope',
  },

  run = ':Neorg sync-parsers',

  config = function()
    require('neorg').setup {
      lazy_loading = true,
      load = {
        ['core.defaults'] = {},

        ---------------------------------------------------------------------------------
        -- SETUP WORKSPACE
        ---------------------------------------------------------------------------------
        ['core.dirman'] = {
          config = {
            workspaces = {
              main = '~/Documents/neorg',
            },
            default_workspace = 'main',
          },
        },

        ---------------------------------------------------------------------------------
        -- CONCEALER
        ---------------------------------------------------------------------------------
        ['core.concealer'] = {
          config = {
            -- icon_preset = 'diamond',
            icons = {
              todo = {
                undone = {
                  icon = ' ',
                },
              },
            },
          },
        },

        ---------------------------------------------------------------------------------
        -- COMPLETION
        ---------------------------------------------------------------------------------
        ['core.completion'] = {
          config = { engine = 'nvim-cmp' },
        },

        ---------------------------------------------------------------------------------
        -- TELESCOPE
        ['core.integrations.telescope'] = {}, -- Enable the telescope module

        ---------------------------------------------------------------------------------
        -- GTD
        ---------------------------------------------------------------------------------
        -- ['core.gtd.base'] = {
        --   config = {
        --     workspace = 'main',
        --     default_lists = {
        --       inbox = 'in.norg',
        --     },
        --   },
        -- },

        ['core.keybinds'] = {
          config = {
            ---@diagnostic disable-next-line: unused-local
            hook = function(keybinds)
              -- here Neorg already started
              -- so we can remove the start mapping and replace it with GLOBAL neorg menu
              -- vim.cmd 'silent! unmap <leader>o'

              --            keybinds.unmap('norg', 'i', '<C-s>')
              --            keybinds.remap_key('norg', 'i', '<C-l>', '<C-s>')

              --            -- this is GLOBAL
              --            require('which-key').register {
              --            ['<leader>o'] = {
              --              name = 'NeOrg',

              --              c = { '<cmd>Neorg keybind all core.gtd.base.capture<cr>', 'Capture' },
              --              v = { '<cmd>Neorg keybind all core.gtd.base.views<cr>', 'Views' },
              --              n = { '<cmd>Neorg keybind all core.dirman.new.note<cr>', 'New Note' },
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
            vim.cmd [[ e ~/Documents/neorg/index.norg ]]
          end,
          'Neorg Start',
        },
      }, -- /register
    }
  end,
}