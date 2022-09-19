local dap = require 'dap'

local dapui = require 'dapui'
dapui.setup()

require('nvim-dap-virtual-text').setup {
  commented = true,
}

-----------------------------------------------------------------------------------------
local sign_bg = vim.fn.synIDattr(vim.fn.hlID 'SignColumn', 'bg')
local normal_bg = vim.fn.synIDattr(vim.fn.hlID 'Normal', 'bg')

local bp_color = '#4488ff'
vim.cmd('hi DapBPSign guifg=' .. bp_color .. ' guibg=' .. sign_bg)
vim.cmd('hi DapBPNr guifg=white guibg=' .. bp_color)
-- vim.cmd('hi link DapBPNr Error')
-- vim.cmd('hi link DapBPLine Error')
vim.fn.sign_define('DapBreakpoint', { text = '⦿', texthl = 'DapBPSign', numhl = 'DapBPNr', linehl = '' })

vim.cmd('hi DapStopSign guifg=orange guibg=' .. sign_bg)
-- vim.cmd('hi DapStopNr guifg=orange guibg=' .. sign_bg)
-- vim.cmd('hi DapStopLine guifg=orange guibg=' .. sign_bg)
vim.cmd 'hi DapStopLine guibg=orange'
-- vim.fn.sign_define('DapStopped', { text = '⇒', texthl = 'DapStopSign', numhl = '', linehl = 'DapStopLine' })
vim.fn.sign_define('DapStopped', { text = '', linehl = 'DapStopLine' })

dap.set_log_level 'TRACE'

vim.cmd [[
  augroup DapRepl
    au!
    au FileType dap-repl lua require('dap.ext.autocompl').attach()
  augroup END
]]

dap.listeners.after.event_initialized['dapui-open'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui-open'] = function()
  print 'before terminated'
  dapui.close()
end

dap.listeners.after.event_terminated['dapui-open'] = function()
  print 'after terminated'
end

dap.listeners.before.event_exited['dapui-open'] = function()
  dapui.close()
end

dap.adapters.ruby = {
  type = 'executable',
  command = 'binx',
  args = { 'readapt', 'stdio' },
}

dap.configurations.ruby = {
  {
    args = { '*${args}' },
    name = 'ruby file',
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
