local glue_map = require('lib.glue').map
local wk = require('which-key')

return {
  {
    'ThePrimeagen/refactoring.nvim', -- https://github.com/ThePrimeagen/refactoring.nvim

    dependencies = {
      'lewis6991/async.nvim',
    },

    lazy = false,

    opts = {},

    config = function(_, opts)
      require('refactoring').setup(opts)
      require('plugins.refactoring.actions').setup()

      wk.add({
        { '<localleader>r', group = 'Refactor' },

        { '<localleader>rn', glue_map('refactoring', 'lsp.actions.rename'), desc = 'Rename' },

        { '<localleader>rr', glue_map('refactoring', 'refactoring.actions.select'), mode = { 'n', 'x' }, desc = 'Select Refactor' },

        {
          mode = { 'n', 'x' },
          expr = true,

          { '<localleader>re', group = 'Extract' },
          { '<localleader>ref', glue_map('refactoring', 'refactoring.actions.extract.function'), desc = 'Extract Function' },
          { '<localleader>reF', glue_map('refactoring', 'refactoring.actions.extract.function.to_file'), desc = 'Extract Function To File' },
          { '<localleader>rev', glue_map('refactoring', 'refactoring.actions.extract.variable'), desc = 'Extract Variable' },

          { '<localleader>ri', group = 'Inline' },
          { '<localleader>rif', glue_map('refactoring', 'refactoring.actions.inline.function'), desc = 'Inline Function' },

          { '<localleader>riv', glue_map('refactoring', 'refactoring.actions.inline.variable'), desc = 'Inline Variable' },
        },
      })
    end,
  },
}
