local debug = my.log.debug
-- local trace = my.log.trace

local config = require('onion.config')

local lsp_maps = require('plugins.lsp.maps')

---@alias SERVER vim.lsp.Config | { mason?: boolean | string, debug?: boolean, enabled?: boolean }
---@alias SERVERS table<string, SERVER>

config.set_defaults('lsp', {
  -------------------------------------------------------------------------------
  --- install those through mason-tool-installer
  -------------------------------------------------------------------------------
  ensure_installed = { 'jq', 'stylua', 'tree-sitter-cli' },

  -------------------------------------------------------------------------------
  --- enable those LSP servers.
  --- the configs come from lspconfig defaults, unless there's a corresponding
  --- file in 'lsp' folder at the root of nvim configuration directory
  -------------------------------------------------------------------------------
  enable = { 'lua_ls', 'ts_ls', 'jsonls', 'yamlls', 'bashls', 'dockerls', 'ruby_lsp' },

  -------------------------------------------------------------------------------
  --- custom LSP server config tweaks
  -------------------------------------------------------------------------------
  ---@type table<string, SERVER>
  servers = {
    ruby_lsp = { cmd = { 'ruby-lsp' } },
  },

  -------------------------------------------------------------------------------
  --- diagnostic
  -------------------------------------------------------------------------------

  diagnostic = {
    icons = { error = '󰅚 ', warn = '󰀪 ', hint = '󰌶 ', info = '󰋽 ' },
  },
})

local au = require('lib.au')
local wk = require('which-key')

return {

  -------------------------------------------------------------------------------
  -- mason
  -------------------------------------------------------------------------------
  {
    'mason-org/mason.nvim', -- https://github.com/mason-org/mason.nvim
    lazy = true,
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    cmd = { 'Mason', 'MasonLog', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll' },
    init = function() wk.add({ [[<leader>am]], group = 'Mason' }) end,

    keys = {
      { [[<leader>amm]], vim.cmd.Mason, desc = 'Mason' },
      { [[<leader>aml]], vim.cmd.MasonLog, desc = 'Mason Log' },
      { [[<leader>amu]], vim.cmd.MasonUpdate, desc = 'Mason Update' },
      { [[<leader>ami]], [[:<c-u>MasonInstall ]], desc = 'Mason Install...' },
    },

    config = true,
  },

  -------------------------------------------------------------------------------
  -- lspconfig
  -------------------------------------------------------------------------------
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

    dependencies = {
      'mason-org/mason.nvim', -- https://github.com/mason-org/mason.nvim
      { 'mason-org/mason-lspconfig.nvim', opts = { ensure_installed = {}, automatic_enable = false } }, -- https://github.com/mason-org/mason-lspconfig.nvim
      'jayp0521/mason-null-ls.nvim', -- https://github.com/jayp0521/mason-null-ls.nvim
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'b0o/schemastore.nvim', -- https://github.com/b0o/schemastore.nvim
      -- Simple progress widget for LSP
      { 'j-hui/fidget.nvim', opts = {} }, -- https://github.com/j-hui/fidget.nvim
      { 'kosayoda/nvim-lightbulb' }, -- https://github.com/kosayoda/nvim-lightbulb
    },

    config = function()
      local ensure_installed = config.get('lsp.ensure_installed', {})
      ---@type SERVERS
      local servers = config.get('lsp.servers') or {}

      for _, server in ipairs(config.get('lsp.enable')) do
        servers[server] = servers[server] or {}
      end

      -- configure tools installer
      for server, conf in pairs(servers) do
        if conf.mason ~= false and conf.enabled ~= false then
          if type(conf.mason) == 'string' then
            table.insert(ensure_installed, conf.mason)
          else
            table.insert(ensure_installed, server)
          end
        end
      end
      require('mason-tool-installer').setup({
        ensure_installed = ensure_installed,
        auto_update = false,
        run_on_start = true,
      })

      -- configure servers
      for server, conf in pairs(servers) do
        -- completion provides extra capabilities
        local capabilities = require('glue').register('lsp.init').call('completion.capabilities', { capabilities = conf.capabilities or {} })
        if capabilities then conf.capabilities = capabilities end

        if conf.debug == true then debug('LSP server config', server, conf) end
        if conf.enabled ~= false then
          vim.lsp.config(server, conf)
          vim.lsp.enable(server)
        end
      end

      local icons = config.get('lsp.diagnostic.icons')

      vim.diagnostic.config({
        severity_sort = true,
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = icons.error,
            [vim.diagnostic.severity.WARN] = icons.warn,
            [vim.diagnostic.severity.INFO] = icons.info,
            [vim.diagnostic.severity.HINT] = icons.hint,
          },
        },
        float = { border = 'rounded', source = 'if_many' },
        virtual_lines = { current_line = true },
        virtual_text = false,
      })

      ---------------------------------------------------------------------------
      --- lightbulb
      ---------------------------------------------------------------------------
      require('nvim-lightbulb').setup({
        code_lenses = true,
        float = { enabled = false },
        autocmd = { enabled = true },
        sign = { enabled = false },
        virtual_text = { enabled = true, hl_mode = 'combine' },
      })

      ---------------------------------------------------------------------------
      --- KEYMAPS
      ---------------------------------------------------------------------------
      lsp_maps.global()
      au.lsp_on_attach('lsp.init', function(client, buf) lsp_maps.buffer(client, buf) end)
    end,
  },
}

--   {
--     'ray-x/lsp_signature.nvim', -- https://github.com/ray-x/lsp_signature.nvim
--     event = { 'BufReadPre', 'BufNewFile' },
--
--     opts = {
--       bind = true,
--       floating_window = true,
--       floating_window_above_cur_line = false,
--       hint_enable = false,
--       -- hint_prefix = 'ℹ️',
--       handler_opts = {
--         border = 'rounded',
--       },
--     },
--
--   },
-- }
