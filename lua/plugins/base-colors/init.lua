-- TODO: Add support for Base16 and shell integration
local debug = my.log.debug

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

local tools = require 'lib.tools'
local hi = tools.highlight

local function get_colors()
  if vim.g.colors_name and vim.startswith(vim.g.colors_name, 'base16-') then
    local base16 = require 'base16-colorscheme'
    local colors = base16.colors
    if colors then -- 'colors' only available when a base16 colorscheme is set in vim
      return {
        bg = colors.base00,
        fg = colors.base05,
        green = colors.base0B,
        red = colors.base08,
        yellow = colors.base0A,
        blue = colors.base0D,
        purple = colors.base0E,
        orange = colors.base09,
        cyan = colors.base0C,
        darkgray = colors.base01,
        gray = colors.base02,
        lightgray = colors.base03,
      }
    end
  end

  return {
    bg = tools.get_hi_attr('Normal', 'bg'),
    fg = tools.get_hi_attr('Normal', 'fg'),
    green = '#198844',
    red = '#cc342b',
    yellow = '#fba922',
    blue = '#3971ed',
    purple = '#a36ac7',
    cyan = '#b5e4f4',
    darkgray = '#3a3432',
    gray = '#4a4543',
    lightgray = '#5c5855',
  }
end

local function override_diff_colors(colors)
  hi.DiffAdd = { guibg = colors.green, guifg = colors.bg, gui = nil, guisp = nil }
  hi.DiffDelete = { guibg = colors.bg, guifg = colors.red, gui = nil, guisp = nil }
  hi.DiffChange = { guibg = colors.yellow, guifg = colors.bg, gui = nil, guisp = nil }
  hi.DiffText = { guibg = colors.green, guifg = colors.bg, gui = nil, guisp = nil }

  hi.GitGutterAdd = { guibg = colors.bg, guifg = colors.yellow, gui = nil, guisp = nil }
  hi.GitGutterDelete = { guibg = colors.bg, guifg = colors.yellow, gui = nil, guisp = nil }
  hi.GitGutterChange = { guibg = colors.bg, guifg = colors.yellow, gui = nil, guisp = nil }
  hi.GitGutterChangeDelete = { guibg = colors.bg, guifg = colors.yellow, gui = nil, guisp = nil }

  hi.GitSignsAdd = 'GitGutterAdd'
  hi.GitSignsChange = 'GitGutterChange'
end

-- I don't like the way base16 color schemes handle diff mode
-- let's owerride some background to meke diffs
-- more 'colorful'.
local function setup_colors_override()
  require('lib.au').on_colorscheme_changed('base.colors.override', function()
    override_diff_colors(get_colors())
  end)
end

return {
  {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 1000,

    config = function(_, opts)
      require('tokyonight').setup {
        on_colors = function(colors)
          colors.border = '#3a3a3a' -- lighter split separator
        end,
      }
    end,
  }, -- https://github.com/folke/tokyonight.nvim

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
      setup_colors_override()

      define_load_vimrc_background_command()

      if my.config.colorscheme == '-load' then
        vim.cmd.LoadVimrcBackground()
      else
        vim.cmd('colorscheme ' .. my.config.colorscheme)
      end
    end,
  },
}
