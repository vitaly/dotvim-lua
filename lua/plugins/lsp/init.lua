local debug = my.log.debug
-- local trace = my.log.trace

local config = require('onion.config')

---@alias SERVER vim.lsp.Config | { mason?: boolean, debug?: boolean }
---@alias SERVERS table<string, SERVER>

config.set_defaults('lsp', {
  ensure_installed = { 'jq', 'stylua', 'tree-sitter-cli', 'copilot' },
  enable = { 'lua_ls', 'ts_ls', 'jsonls', 'yamlls', 'bashls', 'dockerls', 'ruby_lsp' },
  ---@type table<string, SERVER>
  servers = {
    ruby_lsp = { cmd = { 'ruby-lsp' } },
  },
})

local au = require('lib.au')
local glue = require('glue').register('lsp')
local wk = require('which-key')

local function _map(event)
  return function() return glue.call(event) end
end

local function define_lsp_global_maps()
  require('plugins.lsp.actions').setup()
  wk.add({
    { [[<leader>al]], group = 'LSP' },

    { [[<leader>ali]], _map('lsp.actions.lsp_info'), desc = 'Info' },
    { [[<leader>all]], _map('lsp.actions.lsp_log'), desc = 'Log' },
    { [[<leader>als]], _map('lsp.actions.lsp_start'), desc = 'Start' },
    { [[<leader>alS]], _map('lsp.actions.lsp_stop'), desc = 'Stop' },
    { [[<leader>alr]], _map('lsp.actions.lsp_restart'), desc = 'Restart' },
    { [[<leader>alw]], _map('lsp.actions.lsp_workspace_folders'), desc = 'Workspace Folders' },
  })
end

local function define_lsp_buffer_maps(client, buf)
  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, buf) then
    wk.add({
      [[\h]],
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf })) end,
      buffer = buf,
      desc = 'Toggle Inlay Hints',
    })
  end

  wk.add({
    mode = 'n',
    buffer = buf,

    { 'gd', _map('lsp.actions.definition'), desc = 'Go to Definition' },
    { 'gD', _map('lsp.actions.declaration'), desc = 'Go to Declaration' },
    { 'gK', _map('lsp.actions.signature_help'), desc = 'Signature Help' },
    { 'gk', _map('lsp.actions.signature_help'), desc = 'Signature Help' },

    { '<localleader>g', desc = 'Go to' },
    { '<localleader>gd', _map('telescope.lsp.actions.definition'), desc = 'Go to Definition' },
    { '<localleader>gr', _map('telescope.lsp.actions.reference'), desc = 'Go to References' },
    { '<localleader>gi', _map('telescope.lsp.actions.implementation'), desc = 'Go to Implementation' },
    { '<localleader>gt', _map('telescope.lsp.actions.type.definition'), desc = 'Go to Type Definition' },

    { '<localleader>s', desc = 'Search' },
    { '<localleader>sd', _map('telescope.lsp.actions.symbol.document'), desc = 'Document Symbols' },
    { '<localleader>sw', _map('telescope.lsp.actions.symbol.workspace'), desc = 'Workspace Symbols' },
    { '<localleader>sW', _map('telescope.lsp.actions.symbol.workspace.dynamic'), desc = 'Dynamic Workspace Symbols' },

    --
    -- { '', _map('lsp.actions.buf.add_workspace_folder'), desc = 'Add Workspace folder' },
    -- { '', _map('lsp.actions.buf.code_action'), desc = 'Code Action' },
    -- { '', _map('lsp.actions.buf.document_symbol'), desc = 'Document Symbol' },
    -- { '', _map('lsp.actions.buf.implementation'), desc = 'Goto Implementation' },
    -- { '', _map('lsp.actions.buf.incoming_calls'), desc = 'Show Incoming Calls' },
    -- { '', _map('lsp.actions.buf.outgoing_calls'), desc = 'Show Outgoing Calls' },
    -- { '', _map('lsp.actions.buf.references'), desc = 'Show References' },
    -- { '', _map('lsp.actions.buf.remove_workspace_folder'), desc = 'Remove Workspace Folder' },
    -- { '', _map('lsp.actions.buf.signature_help'), desc = 'Signature Help' },
    -- { '', _map('lsp.actions.buf.type_definition'), desc = 'Type Definition' },
    -- { '', _map('lsp.actions.buf.workspace_symbol'), desc = 'Workspace Symbol' },
    --
  })
end

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
      local ensure_installed = config.get('lsp.ensure_installed') or {}
      ---@type SERVERS
      local servers = config.get('lsp.servers') or {}

      for _, server in ipairs(config.get('lsp.enable')) do
        servers[server] = servers[server] or {}
      end

      -- configure tools installer
      for server, conf in pairs(servers) do
        if conf.mason ~= false then table.insert(ensure_installed, server) end
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
        vim.lsp.config(server, conf)
        vim.lsp.enable(server)
      end

      vim.diagnostic.config({ virtual_lines = { current_line = true } })

      -- configure lightbulb
      require('nvim-lightbulb').setup({
        code_lenses = true,
        float = { enabled = false },
        autocmd = { enabled = true },
        sign = { enabled = false },
        virtual_text = { enabled = true },
      })

      define_lsp_global_maps()

      au.lsp_on_attach('lsp.init', function(client, buf) define_lsp_buffer_maps(client, buf) end)
    end,
  },
}

--
-- -- local lib_plugins = require('onion.config').get('lua.add_plugins_to_workspace')
--
-- -- if true ~= lib_plugins then
-- --   table.insert(lib_plugins, 'nvim-dap-ui') -- TODO: configure this from within debugger layer
-- -- end
--
-- return {
--   -------------------------------------------------------------------------------
--   -- lspconfig
--   -------------------------------------------------------------------------------
--   {
--     'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
--
--     dependencies = {
--
--       -- -- lua dev extra setup
--       -- {
--       --   'folke/neodev.nvim', -- https://github.com/folke/neodev.nvim
--       --   opts = {
--       --     -- control adding plugins in my.copnfig.lua
--       --     library = { plugins = lib_plugins },
--       --   },
--       -- },
--
--       -- `config=true` ensures it's setup before lspconfig
--       { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true }, -- https://github.com/folke/neoconf.nvim
--
--
--
--       'hrsh7th/cmp-nvim-lsp',
--
--       -- lightbulb in signcolumn whenever code action is available
--       'kosayoda/nvim-lightbulb', -- https://github.com/kosayoda/nvim-lightbulb
--     },
--
--
--     opts = {
--       -- default LSP capabilities
--       capabilities = {},
--
--       -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
--       -- Be aware that you also will need to properly configure your LSP server to
--       -- provide the inlay hints.
--       inlay_hints = {
--         enabled = false,
--       },
--
--     config = function(_, opts)
--       -- for some reason lspconfig popups do not have a border
--       require('lspconfig.ui.windows').default_options.border = 'single'
--
--       -- configure diagsnostics icons
--       local icons = require('onion.config').get('icons.diagnostics')
--       for type, icon in pairs(icons) do
--         local hl = 'DiagnosticSign' .. type
--         vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
--       end
--
--       -- configure lightbulb
--       require('nvim-lightbulb').setup {
--         float = { enabled = false },
--         autocmd = { enabled = true },
--         sign = { enabled = false },
--         virtual_text = {
--           enabled = true,
--           hl_mode = 'combine',
--         },
--       }
--
--       require('plugins.lsp.install').setup(opts)
--
--       au.lsp_on_attach('lsp.init', require('plugins.lsp.on_attach').on_attach)
--     end,
--   },
--
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
--     config = function()
--       au.lsp_on_attach('lsp_signature', function()
--         require('lsp_signature').on_attach()
--       end)
--     end,
--   },
-- }
