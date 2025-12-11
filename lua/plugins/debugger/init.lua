local config = require('onion.config')
local wk = require('which-key')

-----------------------------------------------------------------
--- adapters to install
config.set_defaults('debugger', {
  ensure_installed = {
    bash = true,
    chrome = false,
    delve = false,
    elixir = false,
    go = true,
    js = false,
    kotlin = false,
    node2 = false,
    python = false,
  },
})

-----------------------------------------------------------------
--- icons
config.set_defaults('icons', {
  debugger = {
    breakpoints = { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '' },
  },
})

-----------------------------------------------------------------
--- configure DAP signs with icons
local function setup_dap_icons()
  for type, icon in pairs(config.get('icons.debugger.breakpoints')) do
    local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
    vim.fn.sign_define('Dap' .. type, { text = icon, texthl = hl, numhl = hl })
  end
  -- TODO: let this be configurable
  vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
  vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
end

return {
  ------------------------------------------------------------------------------
  --- DAP ADAPTERS INSTALLER
  ------------------------------------------------------------------------------
  {
    'jay-babu/mason-nvim-dap.nvim', -- https://github.com/jay-babu/mason-nvim-dap.nvim
    dependencies = { 'mason-org/mason.nvim' },
    config = function(_, opts)
      local ensure_installed = {}
      for name, enabled in pairs(config.get('debugger.ensure_installed', {})) do
        if enabled then table.insert(ensure_installed, name) end
      end
      require('mason-nvim-dap').setup({ ensure_installed = ensure_installed, automatic_installation = true })
    end,
  },

  ------------------------------------------------------------------------------
  --- DAP
  ------------------------------------------------------------------------------
  {
    'mfussenegger/nvim-dap', -- https://github.com/mfussenegger/nvim-dap
    dependencies = {
      'jbyuki/one-small-step-for-vimkind', -- https://github.com/jbyuki/one-small-step-for-vimkind
    },

    keys = {
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Breakpoint Condition' },
      { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
      { '\\b', function() require('dap').toggle_breakpoint() end, desc = 'Toggle Breakpoint' },
      { '<leader>dc', function() require('dap').continue() end, desc = 'Continue' },
      { '<leader>dC', function() require('dap').run_to_cursor() end, desc = 'Run to Cursor' },
      { '<leader>dg', function() require('dap').goto_() end, desc = 'Go to line (no execute)' },
      { '<leader>di', function() require('dap').step_into() end, desc = 'Step Into' },
      { '<leader>dj', function() require('dap').down() end, desc = 'Down' },
      { '<leader>dk', function() require('dap').up() end, desc = 'Up' },
      { '<leader>dl', function() require('dap').run_last() end, desc = 'Run Last' },
      { '<leader>do', function() require('dap').step_out() end, desc = 'Step Out' },
      { '<leader>dO', function() require('dap').step_over() end, desc = 'Step Over' },
      { '<leader>dp', function() require('dap').pause() end, desc = 'Pause' },
      { '<leader>dr', function() require('dap').repl.toggle() end, desc = 'Toggle REPL' },
      { '<leader>ds', function() require('dap').session() end, desc = 'Session' },
      { '<leader>dt', function() require('dap').terminate() end, desc = 'Terminate' },
      { '<leader>dw', function() require('dap.ui.widgets').hover() end, desc = 'Widgets' },

      -- adapters (server side)
      { '<leader>dal', function() require('osv').launch({ port = 8086 }) end, desc = 'Launch Lua Server Adapter (port 8086)' },
    },

    config = function()
      setup_dap_icons()

      local dap = require('dap')

      --------------------------------------------------------------------------
      --- this configuration and adapter allow to attache to a running neovim
      --- instance
      --------------------------------------------------------------------------
      dap.adapters.nlua = function(callback, opts)
        local adapter = { type = 'server', host = opts.host or '127.0.0.1', port = opts.port or 8086 }
        callback(adapter)
      end
      dap.configurations.lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = 'Attach to running Neovim instance (port 8086)',
          port = 8086,
        },
      }
    end,
  },

  ------------------------------------------------------------------------------
  --- DAP UI
  ------------------------------------------------------------------------------
  {
    'rcarriga/nvim-dap-ui', -- https://github.com/rcarriga/nvim-dap-ui

    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      {
        'theHamsta/nvim-dap-virtual-text', -- https://github.com/theHamsta/nvim-dap-virtual-text
        opts = {
          commented = true,
        },
      },
    },

    init = function()
      wk.add({
        mode = { 'n', 'v' },
        {
          { '<leader>d', group = 'Debug' },
          { '<leader>da', group = 'Adapters' },
        },
      })
    end,

    keys = {
      { '<leader>du', function() require('dapui').toggle({}) end, desc = 'Dap UI' },
      { '<leader>de', function() require('dapui').eval() end, desc = 'Eval', mode = { 'n', 'v' } },
    },

    config = function()
      --
      local dap, dapui = require('dap'), require('dapui')

      ---@diagnostic disable-next-line: missing-fields
      require('dapui').setup({
        controls = {
          enabled = true,
        },
      })

      dap.listeners.before.attach.dapui_open = dapui.open
      dap.listeners.before.launch.dapui_oipen = dapui.open
      -- not sure, this was in kickstarter
      -- dap.listeners.after.event_initialized.dapui_open = dapui.open

      dap.listeners.before.event_terminated.dapui_close = dapui.close
      dap.listeners.before.event_exited.dapui_close = dapui.close
    end,
  },
}
