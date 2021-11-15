-- TODO: switch to lua, use g:leader and g:localleader
return function (use)

  use {
    'folke/which-key.nvim', -- https://github.com/folke/which-key.nvim

    config = function()
      vim.opt.timeoutlen = 100      -- 0.5s before keymap menu

      local which_key = require('which-key')
      which_key.setup {
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", '<Plug>'}, -- hide mapping boilerplate
      }

      which_key.register({

        ['<leader>'] = {
          [';'] = { '<plug>Toggle(comment)', 'Toggle Comment' },
          a = {
            name = 'App',
            l = { name = 'LSP', },
            p = { name = 'Packer', },
          },
          b = { name = 'Buffer', },
          f = {
            name = 'File',
            e = {
              name = 'Edit',
              l = { name = 'Local', },
              v = { name = 'Vim', },
            },
            t = { name = 'Toggle', },
          },
          g = { name = 'Git', },
          t = { name = 'Tab', },
          v = { name = 'Vim', },
          w = { name = 'Window', },
          Y = { name = 'Yank', },
          T = { name = 'Toggle', },
        },

        ['<localleader>'] = {
          e = {
            name = 'Eval'
          }

        },
      })

      which_key.register({
        g = {
          c = {
            name = 'Comment',
            c = 'Toggle Comment',
          }
        }
      }, { mode = 'n' })

      which_key.register({
        g = {
          c = 'Toggle Comment',
        },
        ['<leader>'] = {
          [';'] = { '<plug>Toggle(comment)', 'Toggle Comment' },

        },
      }, { mode = 'x' })

    end
  }
end
