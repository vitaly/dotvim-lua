return {
  {
    "williamboman/mason.nvim", -- https://github.com/williamboman/mason.nvim

    config = function()
      require("mason").setup()

      require('which-key').register({
        ['<leader>am'] = {
          name = 'Mason',

          m = { '<cmd>Mason<cr>', 'Mason' },
          l = { '<cmd>MasonLog<cr>', 'Log' },
        }
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim", -- https://github.com/williamboman/mason-lspconfig.nvim

    config = function()
      require("mason-lspconfig").setup()

    end,
  },
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

    requires = {
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      local lspconfig = require('lspconfig')

      require("mason-lspconfig").setup_handlers({
        function (server_name) -- default handler (optional)
          lspconfig[server_name].setup {}
        end,

        ["sumneko_lua"] = function()
          lspconfig.sumneko_lua.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = {
                    'vim',
                    'cmd', 'cmdbang',
                    'map', 'noremap',
                    'nmap', 'nnoremap',
                    'vmap', 'vnoremap',
                    'xmap', 'xnoremap',
                    'smap', 'snoremap',
                    'omap', 'onoremap',
                    'imap', 'inoremap',
                    'lmap', 'lnoremap',
                    'cmap', 'cnoremap',
                    'tmap', 'tnoremap',
                  },
                },
                workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                  },
                },

                telemetry = { enable = false },
              },
            },
          }
        end,


      })

      require('which-key').register({
        ['<leader>al'] = {
          name = 'LSP',

          i = { '<cmd>LspInfo<cr>', 'Info' },
          l = { '<cmd>LspLog<cr>', 'Log' },
          S = { '<cmd>LspStop<cr>', 'Stop' },
          R = { '<cmd>LspRestart<cr>', 'Restart' },
        }
      })
    end
  },
}
