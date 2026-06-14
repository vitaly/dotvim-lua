return {
  {
    'mfussenegger/nvim-lint', -- https://github.com/mfussenegger/nvim-lint

    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
      local lint = require('lint')

      lint.linters_by_ft = {
        javascript = { 'eslint_d' },
      }

      require('lib.au').command('lint.on_save', { 'BufEnter', 'BufWritePost', 'InsertLeave' }, function() lint.try_lint() end)
    end,
  },
}
