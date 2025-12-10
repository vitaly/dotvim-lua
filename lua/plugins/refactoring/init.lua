local glue = require('glue').register('refactoring')
local wk = require('which-key')

local function _map(event)
  -- we map as expr=true, and we need to actually return whatever the refactoring action returns
  return function() return glue.call(event) end
end

return {
  {
    'ThePrimeagen/refactoring.nvim',

    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },

    opts = {},

    config = function(_, opts)
      require('refactoring').setup(opts)
      require('plugins.refactoring.actions').setup()
      require('telescope').load_extension('refactoring')

      wk.add({
        { '<localleader>r', group = 'Refactor' },

        { '<localleader>rn', _map('lsp.actions.rename'), desc = 'Rename' },

        { '<localleader>rr', _map('refactoring.actions.telescope'), desc = 'Select Refactor' },

        {
          mode = { 'n', 'x' },
          expr = true,

          { '<localleader>re', group = 'Extract' },
          { '<localleader>ref', _map('refactoring.actions.extract.function'), desc = 'Extract Function' },
          { '<localleader>reF', _map('refactoring.actions.extract.function.to_file'), desc = 'Extract Function To File' },
          { '<localleader>rev', _map('refactoring.actions.extract.variable'), desc = 'Extract Variable' },
          { '<localleader>reb', _map('refactoring.actions.extract.block'), desc = 'Extract Block' },
          { '<localleader>reB', _map('refactoring.actions.extract.block.to_file'), desc = 'Extract Block To File' },

          { '<localleader>ri', group = 'Inline' },
          { '<localleader>rif', _map('refactoring.actions.inline.function'), desc = 'Inline Function' },

          { '<localleader>riv', _map('refactoring.actions.inline.variable'), desc = 'Inline Variable' },
        },
      })
    end,
  },
}
