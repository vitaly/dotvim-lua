return {
  --------------------------------------------------------------------------
  -- MASON - Installer for nvim
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


  --------------------------------------------------------------------------
  -- Simple progress widget for LSP
  {
    'j-hui/fidget.nvim', -- https://github.com/j-hui/fidget.nvim

    config = function()
      require("fidget").setup{
      }
    end
  },

  --------------------------------------------------------------------------
  -- LSP Config
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

    config = function()
      require('layers.lsp.maps')

      -- this is required for vim.lsp.buf.document_highlight() to work
      -- which is setup in on_attach.lua
      vim.cmd [[
        hi LspReferenceText cterm=inverse gui=inverse
        hi LspReferenceRead cterm=inverse gui=inverse
        hi LspReferenceWrite cterm=inverse gui=inverse
      ]]

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = require('layers.lsp.on_attach')
      })
    end
  },

  --------------------------------------------------------------------------
  -- LSP Install
  {
    "williamboman/mason-lspconfig.nvim", -- https://github.com/williamboman/mason-lspconfig.nvim

    config = function()
      require("mason-lspconfig").setup()

      local lspconfig = require('lspconfig')

      require("mason-lspconfig").setup_handlers({
        function (server_name) -- default handler (optional)
          lspconfig[server_name].setup {
          }
        end,

        --------------------------------------------------------------------
        -- SUMNEKO_LUA
        ["sumneko_lua"] = function()
          lspconfig.sumneko_lua.setup {

            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },

                hint = { enable = true },

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
                  library = vim.api.nvim_get_runtime_file("", true),
                  -- library = {
                  --   [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                  --   [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                  -- },
                },

                telemetry = { enable = false },
              },
            },
          }
        end, -- sumneko_lua


      })

    end,
  },
}
