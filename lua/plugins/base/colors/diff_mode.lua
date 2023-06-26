-- I don't like the way base16 color schemes handle diff mode
-- let's owerride some background to meke diffs
-- more 'colorful'.
return {
  setup = function()
    local function diffmode_colors()
      local base16 = require 'base16-colorscheme'
      local colors = base16.colors
      local hi = base16.highlight

      -- 'colors' only available when a base16 colorscheme is set in vim
      if not colors then
        return
      end

      hi.DiffDelete = { guibg = colors.base00, guifg = colors.base08, gui = nil, guisp = nil }
      hi.DiffAdd = { guibg = colors.base0B, guifg = colors.base00, gui = nil, guisp = nil }
      hi.DiffChange = { guibg = colors.base0A, guifg = colors.base00, gui = nil, guisp = nil }
      hi.DiffText = { guibg = colors.base0B, guifg = colors.base00, gui = nil, guisp = nil }
    end

    require('lib.au').on_colorscheme_changed('base16.diffmode.colors', diffmode_colors, { pattern = 'base16-*' })
  end,
}
