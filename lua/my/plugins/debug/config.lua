local dap = require 'dap'

local dapui = require 'dapui'
dapui.setup()

require('nvim-dap-virtual-text').setup()

vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '➡️', texthl = '', linehl = '', numhl = '' })

dap.set_log_level 'TRACE'

dap.adapters.ruby = {
  type = 'executable',
  command = 'bundle',
  args = { 'exec', 'readapt', 'stdio' },
}

dap.configurations.ruby = {
  {
    args = { '*${args}' },
    name = 'ruby',
    program = '${file}',
    request = 'launch',
    type = 'ruby',
  },

  --   {
  --     type = 'ruby',
  --     request = 'launch',
  --     name = 'Ruby Run',
  --     program = '${file}',
  --     programArgs = { '*${args}' },
  --     useBundler = true,
  --   },
  --   {
  --     type = 'ruby_vsc',
  --     request = 'launch',
  --     name = 'VSC Ruby Run',
  --     program = '${file}',
  --     programArgs = { '*${args}' },
  --     useBundler = true,
  --   },
  --   --   {
  --   --     type = 'ruby',
  --   --     request = 'launch',
  --   --     name = 'Rails',
  --   --     program = 'bundle',
  --   --     programArgs = { 'exec', 'rails', 's' },
  --   --     useBundler = true,
  --   --   },
}

-- local dap_install = require 'dap-install'
-- dap_install.setup {}
-- dap_install.config('ruby_vsc', {})

-- nnoremap('<leader>dII', ':<c-u>DIInstall<space>')
-- nnoremap('<leader>dIU', ':<c-u>DIUninstall<space>')
-- which_key.register {
--   ['<leader>dI'] = {
--     name = 'Installer',
--     L = { '<cmd>DIList<cr>', 'List all installed DAP adapters' },
--     I = { 'Install a DAP adapter' },
--     U = { 'Uninstall a DAP adapter' },
--   },
-- }
