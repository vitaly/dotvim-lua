-- lua/layers/ui/blankline.lua

-- delete all global blankline configuration so that
-- this file can be reloaded
-- otherwise lots of variables are getting set by blankline
-- according to old setup and not re-set on reload
-- HACK: indent_blankline_namespace needs to be preserved, it isn't set from our config
local function cleanup_globals()
  for _, v in pairs(vim.api.nvim_eval 'keys(g:)') do
    if not vim.tbl_contains({ 'indent_blankline_namespace', 'indent_blankline_enabled' }, v) and v:match '^indent_blankline_' then
      vim.g[v] = nil
    end
  end
end

local function setup_colors()
  local colors = require('base16-colorscheme').colors
  if not colors then
    -- 'colors' only available when a base16 colorscheme is set in vim
    return
  end
  for _, n in pairs { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' } do
    -- print(string.format([[hi IndentBlanklineFg%s guibg=none guifg=%s gui=nocombine]], n, colors['base0' .. n]))
    vim.cmd(string.format([[hi IndentBlanklineFg%s guibg=none guifg=%s gui=nocombine]], n, colors['base0' .. n]))
    -- print(string.format([[hi IndentBlanklineBg%s guibg=%s guifg=none gui=nocombine]], n, colors['base0' .. n]))
    vim.cmd(string.format([[hi IndentBlanklineBg%s guibg=%s guifg=none gui=nocombine]], n, colors['base0' .. n]))
  end
end

local common_options = {
  buftype_exclude = { 'terminal' },
  filetype_exclude = { 'mason', 'packer', 'filetype=TelescopePrompt', 'help' },
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
}

local line_options = {
  char = '▏',
  -- char = '┊',
  char_highlight_list = {
    -- 'IndentBlanklineFg0',
    'IndentBlanklineFg1',
    'IndentBlanklineFg2',
    'IndentBlanklineFg3',
    -- 'IndentBlanklineFg4',
    -- 'IndentBlanklineFg5',
    -- 'IndentBlanklineFg6',
    -- 'IndentBlanklineFg7',
    -- 'IndentBlanklineFg8',
    -- 'IndentBlanklineFg9',
    -- 'IndentBlanklineFgA',
    -- 'IndentBlanklineFgB',
    -- 'IndentBlanklineFgC',
    -- 'IndentBlanklineFgD',
    -- 'IndentBlanklineFgE',
    -- 'IndentBlanklineFgF',
  },
  space_char_highlight_list = {},
}

local space_options = {
  char = '',
  space_char_blankline = ' ',
  space_char_highlight_list = {
    -- 'IndentBlanklineBg0',
    'IndentBlanklineBg1',
    'IndentBlanklineBg2',
    'IndentBlanklineBg3',
    -- 'IndentBlanklineBg4',
    -- 'IndentBlanklineBg5',
    -- 'IndentBlanklineBg6',
    -- 'IndentBlanklineBg7',
    -- 'IndentBlanklineBg8',
    -- 'IndentBlanklineBg9',
    -- 'IndentBlanklineBgA',
    -- 'IndentBlanklineBgB',
    -- 'IndentBlanklineBgC',
    -- 'IndentBlanklineBgD',
    -- 'IndentBlanklineBgE',
    -- 'IndentBlanklineBgF',
  },
}

local function config(extra)
  return vim.tbl_extend('force', common_options, vim.g.blankline_spaces and space_options or line_options, extra or {})
end

local function configure_blankline(extra)
  cleanup_globals()
  setup_colors()
  local conf = config(extra)
  require('indent_blankline').setup(conf)
end

local function reconfigure_blankline()
  configure_blankline { enabled = true }
  require('indent_blankline.commands').refresh(true)
end

local toggle_spaces = require('lib.toggle').toggler('g:blankline_spaces', { false, true }, reconfigure_blankline, { verbose = true })

local function setup_keymaps()
  require('which-key').register {
    ['\\'] = {
      b = { '<cmd>IndentBlanklineToggle!<cr>', 'Blankline' },
      B = { toggle_spaces, 'Blankline Spaces' },
    },
  }
end

return {
  'lukas-reineke/indent-blankline.nvim', -- https://github.com/lukas-reineke/indent-blankline.nvim

  after = {
    'nvim-base16',
  },

  -- pack/packer/opt/indent-blankline.nvim/lua/indent_blankline/init.lua

  -- using `_config` becase we need `configure_blankline` from the scope
  _config = function()
    -- TODO: use  my.config
    vim.g.blankline_spaces = true
    vim.g.indent_blankline_enabled = false

    my.au.on_colorscheme('blankline_colors', setup_colors)
    configure_blankline()
    setup_keymaps()

    -- require("indent_blankline.commands").disable(true)
    -- vim.g.indent_blankline_enabled = false
  end,
}
