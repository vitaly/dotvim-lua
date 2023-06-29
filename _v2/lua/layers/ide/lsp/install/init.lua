-- lua/layers/ide/lsp/install/init.lua

-- load server config from a module
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

return {

  requires = {},

  after = 'nvim-lspconfig',

  -- using `_config` becase we need `setup_install_handlers` from the scope
  _config = function()
    setup_install_handlers()
  end,
}
