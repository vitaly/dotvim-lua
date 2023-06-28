-- lua/layers/telescope/config.lua

return {
  config = function()
    -- config ----------------------------------------------------------------------
    local telescope = require 'telescope'

    my.au.on_colorscheme('telescope-border', function()
      vim.cmd [[
       hi! link TelescopeBorder FloatBorder
       hi! link TelescopePromptBorder FloatBorder
      ]]
    end)
    telescope.load_extension 'fzf'
    -- TODO: dap extension
    -- telescope.load_extension 'dap'
  end,
}
