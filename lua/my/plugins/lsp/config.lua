require 'my.plugins.lsp.config.style'
require 'my.plugins.lsp.config.hover'
require 'my.plugins.lsp.diagnostics'
require 'my.plugins.lsp.maps'

local defaults = {
  on_attach = require 'my.plugins.lsp.on-attach',
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  -- capabilities = vim.tbl_extend('keep', capabilities, require('lsp-status').capabilities),
}
require('my.plugins.lsp.server.solargraph').setup(defaults)
require('my.plugins.lsp.server.installer').setup(defaults)
