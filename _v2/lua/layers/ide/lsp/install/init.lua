-- lua/layers/ide/lsp/install/init.lua

-- shared config defaults
local defaults = {
  capabilities = require('layers.ide.cmp.config').capabilities,
}

-- load server config from a module
local server = function(name)
  return function()
    require('layers.ide.lsp.install.' .. name).setup(defaults)
  end
end

local function setup_install_handlers()
  require('mason-lspconfig').setup_handlers {
    function(server_name) -- default handler (optional)
      -- PRINT { 'MASON-LSP', server_name }
      require('lspconfig')[server_name].setup(defaults)
    end,

    lua_ls = server 'lua_ls',
    jsonls = server 'jsonls',
    solargraph = server 'solargraph',
  }
end

local function setup_keymaps()
  require('which-key').register {
    ['<leader>am'] = {
      name = 'Mason',

      m = { '<cmd>Mason<cr>', 'Mason' },
      l = { '<cmd>MasonLog<cr>', 'Log' },
    },
    ['<leader>sm'] = { '<cmd>Mason<cr>', 'Mason' },
  }
end

return {
  'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim

  requires = {
    'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim
    'b0o/schemastore.nvim', -- https://github.com/b0o/schemastore.nvim
  },

  -- using `_config` becase we need `setup_install_handlers` from the scope
  _config = function()
    require('mason').setup()
    require('mason-lspconfig').setup { ensure_installed = { 'lua_ls', 'jsonls', 'tsserver', 'solargraph', 'pyright' } }
    setup_install_handlers()
    setup_keymaps()
  end,
}