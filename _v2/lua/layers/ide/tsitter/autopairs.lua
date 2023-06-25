----------------------------------------------------------------------------------------------
-- AUTO PAIRS
-- not quite treesitter thing, but it uses treesitter, and fails if it's not installed
return {
  'windwp/nvim-autopairs', -- https://github.com/windwp/nvim-autopairs

  requires = {
    'nvim-treesitter/nvim-treesitter',
  },

  config = function()
    local autopairs = require 'nvim-autopairs'

    autopairs.setup {
      check_ts = true,
      ts_config = {},
      disable_filetype = { 'TelescopePrompt' }, -- vim , json
    }

    -- -- XXX do this only for ruby
    autopairs.add_rules(require 'nvim-autopairs.rules.endwise-ruby')
    autopairs.add_rules(require 'nvim-autopairs.rules.endwise-lua')
  end,
}
