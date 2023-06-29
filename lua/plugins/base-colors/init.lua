-- TODO: Add support for Base16 and shell integration

local function define_load_vimrc_background_command()
  vim.api.nvim_create_user_command('LoadVimrcBackground', function()
    vim.cmd [[
          if filereadable(expand("~/.vimrc_background"))
            try | source ~/.vimrc_background | catch | echo "colorscheme load error" | endtry
          endif
        ]]
  end, {
    nargs = 0,
  })
end

-- I don't like the way base16 color schemes handle diff mode
-- let's owerride some background to meke diffs
-- more 'colorful'.
local function setup_base16_colors_override()
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
end

return {
  { 'folke/tokyonight.nvim', lazy = true, priority = 1000 }, -- https://github.com/folke/tokyonight.nvim

  {
    'RRethy/nvim-base16', -- https://github.com/RRethy/nvim-base16
    lazy = false,
    priority = 1000,

    keys = {
      { '<plug>(Vim/Update-Colors)', '<cmd>LoadVimrcBackground<cr>' },
      { '<leader>vc', '<plug>(Vim/Update-Colors)', remap = false },
    },

    config = function()
      -- setup handler for adjusting base16 colors for diff-mode
      -- need to do this before we acrually change into the base16 colorscheme
      setup_base16_colors_override()

      define_load_vimrc_background_command()

      if my.config.colorscheme == '-load' then
        vim.cmd.LoadVimrcBackground()
      else
        vim.cmd('colorscheme ' .. my.config.colorscheme)
      end
    end,
  },
}
