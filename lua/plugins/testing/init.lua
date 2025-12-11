local config = require('onion.config')
local wk = require('which-key')

return {
  ------------------------------------------------------------------------------
  --- NEOTEST
  ------------------------------------------------------------------------------
  {
    'nvim-neotest/neotest', -- https://github.com/nvim-neotest/neotest

    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',

      {
        'nvim-neotest/neotest-vim-test', -- https://github.com/nvim-neotest/neotest-vim-test
        dependencies = {
          'vim-test/vim-test', -- https://github.com/vim-test/vim-test
        },
      },
    },

    lazy = false,

    init = function()
      wk.add({
        mode = { 'n', 'v' },
        { '<leader>t', group = 'Test' },
        { '<leader>to', group = 'Output' },
        { '<leader>td', group = 'Debug' },
        { '<leader>tw', group = 'Watch' },
      })
    end,

    keys = {
      -- run tests
      { '<leader>tn', function() require('neotest').run.run() end, desc = 'Test Nearest' },
      { '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = 'Test File' },
      { '<leader>ta', function() require('neotest').run.run(vim.uv.cwd()) end, desc = 'Test All' },
      { '<leader>tl', function() require('neotest').run.run_last() end, desc = 'Test Last' },
      { '<leader>ts', function() require('neotest').run.stop() end, desc = 'Stop' },

      -- debug tests (requires nvim-dap)
      ---@diagnostic disable-next-line: missing-fields
      { '<leader>tdn', function() require('neotest').run.run({ strategy = 'dap' }) end, desc = 'Debug Nearest' },
      ---@diagnostic disable-next-line: missing-fields
      { '<leader>tdf', function() require('neotest').run.run({ vim.fn.expand('%'), strategy = 'dap' }) end, desc = 'Debug File' },

      -- output
      { '<leader>too', function() require('neotest').output.open({ enter = true, auto_close = true }) end, desc = 'Output' },
      { '<leader>tol', function() require('neotest').output.open({ enter = true, auto_close = true, last_run = true }) end, desc = 'Output (Last)' },
      { '<leader>top', function() require('neotest').output_panel.toggle() end, desc = 'Output Panel' },
      { '<leader>toc', function() require('neotest').output_panel.clear() end, desc = 'Clear Output Panel' },

      -- summary panel
      { '<leader>tu', function() require('neotest').summary.toggle() end, desc = 'Toggle Summary' },

      -- watch mode (LSP-based, requires symbol_queries for the language)
      { '<leader>twf', function() require('neotest').watch.toggle(vim.fn.expand('%')) end, desc = 'Watch File (LSP)' },
      { '<leader>twn', function() require('neotest').watch.toggle() end, desc = 'Watch Nearest (LSP)' },
      -- simple watch: re-run on any buffer save
      { '<leader>tws', function() require('plugins.testing.watch').toggle() end, desc = 'Watch on Save (simple)' },

      -- navigation
      { '[t', function() require('neotest').jump.prev({ status = 'failed' }) end, desc = 'Prev Failed Test' },
      { ']t', function() require('neotest').jump.next({ status = 'failed' }) end, desc = 'Next Failed Test' },
    },

    config = function()
      local neotest_vim_test = require('neotest-vim-test')

      -- Workaround: neotest-vim-test tries to run in a subprocess which doesn't
      -- have lazy.nvim's runtimepath. Override the functions to use local versions
      -- directly instead of subprocess calls.
      neotest_vim_test.is_test_file = neotest_vim_test._is_test_file
      neotest_vim_test.discover_positions = neotest_vim_test._discover_positions
      neotest_vim_test.build_spec = neotest_vim_test._build_spec

      ---@diagnostic disable-next-line: missing-fields
      require('neotest').setup({
        adapters = {
          -- don't use vim-test for languages that have dedicated neotest adapters
          neotest_vim_test({ ignore_file_types = { 'python', 'lua', 'go', 'rust', 'javascript', 'typescript' } }),
        },
      })
    end,
  },

  ------------------------------------------------------------------------------
  --- VIM-TEST (base plugin, used via neotest-vim-test)
  ------------------------------------------------------------------------------
  {
    'vim-test/vim-test', -- https://github.com/vim-test/vim-test

    init = function()
      -- default bats configuration (can be overridden per-project in .nvim.lua)
      vim.g['test#shell#bats#executable'] = 'bats'
      vim.g['test#shell#bats#options'] = '--tap'

      -- custom test commands allow per-project overrides
      -- see :help test-custom-runners
      vim.g['test#custom_runners'] = vim.g['test#custom_runners'] or {}
    end,
  },
}
