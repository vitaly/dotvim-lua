local glue = require('glue').register('refactoring')
local wk = require('which-key')

local function _map(event)
  -- we map as expr=true, and we need to actually return whatever the refactoring action returns
  return function() return glue.call(event) end
end

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

        { '<localleader>rn', _map('lsp.actions.rename'), desc = 'Rename' },

        { '<localleader>rr', _map('refactoring.actions.select'), mode = { 'n', 'x' }, desc = 'Select Refactor' },

        {
          mode = { 'n', 'x' },
          expr = true,

          { '<localleader>re', group = 'Extract' },
          { '<localleader>ref', _map('refactoring.actions.extract.function'), desc = 'Extract Function' },
          { '<localleader>reF', _map('refactoring.actions.extract.function.to_file'), desc = 'Extract Function To File' },
          { '<localleader>rev', _map('refactoring.actions.extract.variable'), desc = 'Extract Variable' },

          { '<localleader>ri', group = 'Inline' },
          { '<localleader>rif', _map('refactoring.actions.inline.function'), desc = 'Inline Function' },

          { '<localleader>riv', _map('refactoring.actions.inline.variable'), desc = 'Inline Variable' },
        },
      })
    end,
  },
}
