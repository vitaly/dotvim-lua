-- TODO: switch to lua, use g:leader and g:localleader
return function (use)

  use {
    "folke/which-key.nvim",

    config = function()
      vim.opt.timeoutlen = 100      -- 0.5s before keymap menu

      local which_key = require("which-key")
      which_key.setup {
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ ", '<Plug>'}, -- hide mapping boilerplate
      }

      which_key.register({
          a = { name = 'App',
            l = { name = 'LSP', },
            p = { name = 'Packer', },
          },
          b = { name = 'Buffer', },
          f = { name = 'File',
            e = { name = 'Edit',
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
        }, { prefix = '<leader>' })

    end
  }
end
