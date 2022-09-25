-- lua/layers/ide/lsp/install/init.lua

return {
  setup = function()
    require('mason').setup()

    require('mason-lspconfig').setup {
      -- TODO: pass to layers as argument
      ensure_installed = { 'sumneko_lua' },
    }

    local defaults = {
      capabilities = require('layers.ide.cmp.config').capabilities(),
    }

    local server = function(name)
      return function()
        require('layers.ide.lsp.install.' .. name).setup(defaults)
      end
    end

    require('mason-lspconfig').setup_handlers {
      function(server_name) -- default handler (optional)
        require('lspconfig')[server_name].setup(defaults)
      end,

      --------------------------------------------------------------------
      -- SUMNEKO_LUA
      ['sumneko_lua'] = server 'sumneko_lua',
      -- ['sumneko_lua'] = function()
      --   require('layers.ide.lsp.install.sunneko').setup {
      --     capabilities = capabilities,
      --   }
      -- end,
    }

    require('which-key').register {
      ['<leader>am'] = {
        name = 'Mason',

        m = { '<cmd>Mason<cr>', 'Mason' },
        l = { '<cmd>MasonLog<cr>', 'Log' },
      },
    }
  end,
}
