local debug = my.log.debug
local trace = my.log.trace

local map_keys = require('lib.tools').map_keys
local maps = require 'plugins.lsp.maps'
local au = require 'lib.au'

return {

  -- register menu group
  require('lib.tools').register_keymap_groups {
    [ [[<leader>al]] ] = { name = 'Lspconfig' },
    [ [[<leader>an]] ] = { name = 'Null Ls' },
  },

  -------------------------------------------------------------------------------
  -- lspconfig
  -------------------------------------------------------------------------------
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
    dependencies = {
      'b0o/schemastore.nvim', -- https://github.com/b0o/schemastore.nvim
      -- `config=true` ensures it's setup before lspconfig
      { 'folke/neodev.nvim', config = true }, -- https://github.com/folke/neodev.nvim
      -- `config=true` ensures it's setup before lspconfig
      { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true }, -- https://github.com/folke/neoconf.nvim
      -- Simple progress widget for LSP
      { 'j-hui/fidget.nvim', branch = 'legacy', opts = {} }, -- https://github.com/j-hui/fidget.nvim

      'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim
      'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim

      'hrsh7th/cmp-nvim-lsp',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'LspInfo', 'LspLog', 'LspStart', 'LspStop', 'LspRestart', 'LspInstall', 'LspUninstall' },

    keys = {
      map_keys(maps.lsp_info, [[<leader>Sl]]),

      map_keys(maps.lsp_info, [[<leader>ali]]),
      map_keys(maps.lsp_log, [[<leader>all]]),
      map_keys(maps.lsp_start, [[<leader>als]]),
      map_keys(maps.lsp_stop, [[<leader>alS]]),
      map_keys(maps.lsp_restart, [[<leader>alr]]),
    },

    opts = {
      -- default LSP capabilities
      capabilities = {},

      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = false,
      },

      ensure_installed = { 'tsserver', 'pyright' },

      -- Lspconfig Server Settings
      ---@type table<string, lspconfig.options>
      servers = {
        -- e.g.
        -- lua_ls = {
        --  ...
        -- }
      },

      ---@type table<string, fun(name:string, config: lspconfig.options)>
      setup = {
        -- -- example to setup with typescript.nvim
        -- foobar = function(_, config)
        --    ...
        -- end,
        -- -- default setup
        -- ["*"] = function(name, config)
        --   require('lspconfig').foobar.setup(config)
        -- end,
      },
    },

    config = function(_, opts)
      -- for some reason lspconfig popups do not have a border
      require('lspconfig.ui.windows').default_options.border = 'single'

      local icons = my.config.icons.diagnostics
      for type, icon in pairs(icons) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      if opts.inlay_hints.enabled and vim.lsp.buf.inlay_hint then
        au.lsp_on_attach('inlay_hints', function(client, buffer)
          if client.server_capabilities.inlayHintProvider then
            debug { 'inlay_hints', client.name }
            vim.lsp.buf.inlay_hint(buffer, true)
          end
        end)
      end

      require('plugins.lsp.install').setup(opts)

      au.lsp_on_attach('lsp.init', require('plugins.lsp.on_attach').on_attach)
    end,
  },

  {
    'ray-x/lsp_signature.nvim', -- https://github.com/ray-x/lsp_signature.nvim

    opts = {
      bind = true,
      floating_window = true,
      floating_window_above_cur_line = false,
      hint_enable = false,
      -- hint_prefix = 'ℹ️',
      handler_opts = {
        border = 'rounded',
      },
    },

    config = function(_, opts)
      au.lsp_on_attach('lsp_signature', function()
        require('lsp_signature').on_attach()
      end)
    end,
  },
}
