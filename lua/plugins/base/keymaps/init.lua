---------------------------------------------------------------------------------
-- returns mapping for given key to edit file with given path
---------------------------------------------------------------------------------
function edit_file_map(key, path, name)
  return { key, "<cmd>exe 'e' '" .. my.root .. path .. "'<cr>", desc = 'Edit ' .. name }
end


---------------------------------------------------------------------------------
-- redraw
---------------------------------------------------------------------------------
local function redraw()
  vim.cmd [[redraw]]
end


---------------------------------------------------------------------------------
-- toggles
local toggle = require 'lib.toggle'
local toggle_concealcursor = toggle.toggler('o:concealcursor', { 'n', '' }, redraw)
local toggle_conceallevel = toggle.toggler('o:conceallevel', { 0, 1, 2 }, redraw)
local toggle_clipboard = toggle.toggler('o:clipboard', { 'unnamedplus', '' }, redraw)


---------------------------------------------------------------------------------
-- toggle verbose log
local function toggle_verboselog()
  if vim.o.verbose == 0 then
    vim.o.verbose = 9
    vim.o.verbosefile = './vim.log'
    print('verbose on into "' .. vim.o.verbosefile .. '"')
  else
    vim.o.verbose = 0
    vim.o.verbosefile = ''
    print 'verbose off'
  end
  redraw()
end


---------------------------------------------------------------------------------
-- find next line with equal (or lower) indent level
---------------------------------------------------------------------------------
local debug = my.log.debug
local function next_indent(exclusive, fwd, lowerlevel, skipblanks)
  local line = vim.fn.line '.'
  local column = vim.fn.col '.'
  local lastline = vim.fn.line '$'
  local indent = vim.fn.indent(line)
  local stepvalue = fwd and 1 or -1
  while line > 0 and line <= lastline do
    line = line + stepvalue
    if (not lowerlevel and vim.fn.indent(line) == indent) or (lowerlevel and vim.fn.indent(line) < indent) then
      if not skipblanks or #vim.fn.getline(line) > 0 then
        if exclusive then
          line = line - stepvalue
        end
        vim.notify('line: ' .. line .. ' column: ' .. column)
        vim.cmd('' .. line)
        vim.cmd 'normal ^'
        return
      end
    end
  end
end


---------------------------------------------------------------------------------
-- PLUGIN CONFIG
---------------------------------------------------------------------------------
return {
  'folke/which-key.nvim', -- https://github.com/folke/which-key.nvim

  event = 'VeryLazy',

  keys = {
    { '<leader>q', '<cmd>qa<cr>', mode = { 'n', 'x' }, desc = 'Quit All' },
    { '<leader>Q', '<cmd>qa!<cr>', mode = { 'n', 'x' }, desc = 'Quit All!' },
    { '<leader>x', '<cmd>q<cr>', mode = { 'n', 'x' }, desc = 'Close Window' },
    { '<leader>wq', '<cmd>q<cr>', mode = { 'n', 'x' }, desc = 'Close Window' },

    { '<localleader><leader>', '<cmd>w<cr>', desc = 'Save' },

    -- stylua: ignore start
    { '[l', function() next_indent(false, false, false, true) end, desc = 'Prev Indent', },
    { ']l', function() next_indent(false, true, false, true) end, desc = 'Next Indent', },
    { '[L', function() next_indent(false, false, true, true) end, desc = 'Prev Lower Indent', },
    { ']L', function() next_indent(false, true, true, true) end, desc = 'Next Lower Indent', },
    -- stylua: ignore end

    { '<leader><space>', ':' },

    { 'Q', 'gq', mode = { 'n', 'v', 'o' } },

    { '<plug>(Last-Buffer)', '<cmd>b#<cr>', desc = 'Switch to last buffer' },
    { '<leader>`', '<plug>(Last-Buffer)' },

    { '<', '<gv', mode = 'x', desc = 'Keep selection after outdent' },
    { '>', '>gv', mode = 'x', desc = 'Keep selection after indent' },

    { 'j', 'gj' },
    { 'k', 'gk' },

    { '+', '<C-a>', desc = 'Increment' },
    { '-', '<C-x>', desc = 'Decrement' },

    { 'n', 'nzz', desc = 'Search Next and Center' },
    { 'N', 'Nzz', desc = 'Search Prev and Center' },
    { '*', '*zz', desc = 'Search Word and Center' },
    { '#', '#zz', desc = 'Search Word Back and Center' },
    { 'g*', 'g*zz', desc = 'Search and Center' },
    { 'g#', 'g#zz', desc = 'Search Back and Center' },

    -- fast expand current file's directory in command mode
    { '%%', [[<C-R>=expand('%:h').'/'<cr>]], mode = 'c', desc = 'Expand current file directory' },
    { '%^', [[<C-R>=expand('%:p:h').'/'<cr>]], mode = 'c', desc = 'Expand current absolute file directory' },

    -- move lines up/down
    { '<C-j>', ':m .+1<CR>==', desc = 'Move line down' },
    { '<C-k>', ':m .-2<CR>==', desc = 'Move line up' },
    { '<C-j>', ":m '>+1<CR>gv=gv", mode = 'x', desc = 'Move selected lines down' },
    { '<C-k>', ":m '<-2<CR>gv=gv", mode = 'x', desc = 'Move selected lines up' },

    { '<esc>', '<cmd>silent noh<cr>', silent = true, desc = 'Clear search highlight' },

    -- c-ghjk navigation
    { '<c-k>', '<up>', mode = { 'i', 'c' } },
    { '<c-j>', '<down>', mode = { 'i', 'c' } },
    { '<c-h>', '<left>', mode = { 'i' } },
    { '<c-l>', '<right>', mode = { 'i' } },

    -- messages
    { '<leader>m', '<cmd>messages<cr>', desc = 'Messages' },
    { '<leader>M', '<cmd>messages clear<cr>', desc = 'Clear Messages' },

    { '<leader>n', '<cmd>cn<cr>', desc = 'Next' },
    { '<leader>p', '<cmd>cp<cr>', desc = 'Prev' },

    -- buffer
    { '<leader>bn', '<cmd>bn<cr>', desc = 'Next Buffer' },
    { '<leader>bp', '<cmd>bp<cr>', desc = 'Prev Buffer' },
    { '<leader>bd', '<cmd>bd<cr>', desc = 'Delete Buffer' },

    -- file
    { '<leader>fs', '<cmd>w<cr>', desc = 'Save File' },
    { '<leader>fa', '<cmd>wa<cr>', desc = 'Save All Files' },
    { '<leader>fx', [[<cmd>!chmod +x %<cr>]], desc = 'Make Executable' },

    { '<leader>feL', [[<cmd>exe 'e' stdpath('cache').'/lsp.log'<cr>]], 'LSP log' },
    edit_file_map('<leader>fei', '/init.lua', 'Init'),
    edit_file_map('<leader>fek', '/lua/plugins/base/keymaps/keys.lua', 'Keymaps'),
    edit_file_map('<leader>feo', '/lua/init/options.lua', 'Options'),
    edit_file_map('<leader>fep', '/lua/init/plugins.lua', 'Plugins'),
    edit_file_map('<leader>fer', '/README.md', 'README'),
    edit_file_map('<leader>fes', '/scratch.lua', 'Scratch'),

    -- window
    { '<leader>w<bar>', [[<c-w><bar>]], desc = 'Max Width' },
    { '<leader>w_', [[<c-w>_]], desc = 'Max Height' },
    { '<leader>w=', [[<c-w>=]], desc = 'Rebalance' },

    { '<leader>wx', [[<c-w>x]], desc = 'Swap' },
    { '<leader>wK', [[<c-w>K]], desc = 'Move Up' },
    { '<leader>wJ', [[<c-w>J]], desc = 'Move Down' },
    { '<leader>wH', [[<c-w>H]], desc = 'Move Left' },
    { '<leader>wL', [[<c-w>L]], desc = 'Move Right' },

    { '<leader>w-', [[<cmd>split<cr><c-w>j]], desc = 'Split' },
    { '<leader>w<bslash>', [[<cmd>vsplit<cr><c-w>l]], desc = 'VSplit' },

    { '<leader>wt', [[<c-w>T]], desc = 'Move to new Tab' },
    { '<leader>wo', [[<c-w>o]], desc = 'Only' },

    { '<tab>n', [[<cmd>tabnew<cr>]], desc = 'New' },

    { '<leader>vr', [[<cmd>redraw!<cr>]], desc = 'Redraw' },

    { '<leader>Yp', [[<cmd>let @*=expand("%")<cr>:echo "Copied file path to clipboard"<cr>]], desc = 'File Path' },
    { '<leader>Yn', [[<cmd>let @*=expand("%:t")<cr>:echo "Copied file name to clipboard"<cr>]], desc = 'File Name' },
    { '<leader>Yd', [[<cmd>let @*=expand("%:h")<cr>:echo "Copied file directory to clipboard"<cr>]], desc = 'File Directory' },
    { '<leader>Y.', [[<cmd>let @*=getcwd()<cr>:echo @*<cr>]], desc = 'Current Directory' },

    { '\\w', '<cmd>set nolist!<cr>', desc = 'White Space' },
    { '\\r', '<cmd>set relativenumber!<cr>', desc = 'Relative Number' },
    { '\\s', '<cmd>setlocal spell!<cr>', desc = 'Spell Check' },
    { '\\o', '<cmd>set ro!<cr>', desc = 'Read Only' },

    { '\\c', toggle_clipboard, desc = 'clipboard' },

    { '\\nc', toggle_concealcursor, desc = 'Cursor' },
    { '\\nn', toggle_conceallevel, desc = 'Level' },

    { '\\dv', toggle_verboselog, desc = 'Vim Verbose Log' },
  },

  opts = {
    window = { border = 'single' },
    hidden = { '<silent>', '<cmd>', '<Cmd>', '<cr>', '<CR>', 'call ', 'lua ', '<C-U>', '^:', '^ ', '<Plug>' },
    disable = { filetypes = { 'TelescopePrompt' } },

    register = {
      ['<localleader>'] = { name = ',' },
      ['<localleader>e'] = { name = 'Eval' },

      ['<leader>'] = { name = 'SPC' },
      ['<leader>a'] = { name = 'App' },
      ['<leader>b'] = { name = 'Buffer' },
      ['<leader>f'] = { name = 'File' },
      ['<leader>fe'] = { name = 'File Edit' },
      ['<leader>w'] = { name = 'Window' },
      ['<leader>s'] = { name = 'Status / Show' },
      ['<leader>v'] = { name = 'Vim' },
      ['<leader>Y'] = { name = 'Yank' },
      ['<leader><tab>'] = { name = 'Tab' },

      ['\\'] = { name = 'Toggle' },
      ['\\n'] = { name = 'Conceal' },
      ['\\d'] = { name = 'Debug' },
      ["\\'"] = { name = 'Misc' },
    },
  },

  config = function(_, opts)
    require('plugins.base.keymaps.diff-mode').setup()

    vim.opt.timeoutlen = 500 -- 0.5s before keymap menu
    require('which-key').setup(opts)
    require('which-key').register(opts.register, { mode = { 'n', 'v' } })
  end,
}

-- DEFAULTS:
-- {
--  plugins = {
--    marks = true, -- shows a list of your marks on ' and `
--    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
--    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
--    -- No actual key bindings are created
--    spelling = {
--      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
--      suggestions = 20, -- how many suggestions should be shown in the list?
--    },
--    presets = {
--      operators = true, -- adds help for operators like d, y, ...
--      motions = true, -- adds help for motions
--      text_objects = true, -- help for text objects triggered after entering an operator
--      windows = true, -- default bindings on <c-w>
--      nav = true, -- misc bindings to work with windows
--      z = true, -- bindings for folds, spelling and others prefixed with z
--      g = true, -- bindings for prefixed with g
--    },
--  },
--  -- add operators that will trigger motion and text object completion
--  -- to enable all native operators, set the preset / operators plugin above
--  operators = { gc = "Comments" },
--  key_labels = {
--    -- override the label used to display some keys. It doesn't effect WK in any other way.
--    -- For example:
--    -- ["<space>"] = "SPC",
--    -- ["<cr>"] = "RET",
--    -- ["<tab>"] = "TAB",
--  },
--  motions = {
--    count = true,
--  },
--  icons = {
--    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
--    separator = "➜", -- symbol used between a key and it's label
--    group = "+", -- symbol prepended to a group
--  },
--  popup_mappings = {
--    scroll_down = "<c-d>", -- binding to scroll down inside the popup
--    scroll_up = "<c-u>", -- binding to scroll up inside the popup
--  },
--  window = {
--    border = "none", -- none, single, double, shadow
--    position = "bottom", -- bottom, top
--    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
--    padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
--    winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
--    zindex = 1000, -- positive value to position WhichKey above other floating windows.
--  },
--  layout = {
--    height = { min = 4, max = 25 }, -- min and max height of the columns
--    width = { min = 20, max = 50 }, -- min and max width of the columns
--    spacing = 3, -- spacing between columns
--    align = "left", -- align columns left, center or right
--  },
--  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
--  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " }, -- hide mapping boilerplate
--  show_help = true, -- show a help message in the command line for using WhichKey
--  show_keys = true, -- show the currently pressed key and its label as a message in the command line
--  triggers = "auto", -- automatically setup triggers
--  -- triggers = {"<leader>"} -- or specifiy a list manually
--  -- list of triggers, where WhichKey should not wait for timeoutlen and show immediately
--  triggers_nowait = {
--    -- marks
--    "`",
--    "'",
--    "g`",
--    "g'",
--    -- registers
--    '"',
--    "<c-r>",
--    -- spelling
--    "z=",
--  },
--  triggers_blacklist = {
--    -- list of mode / prefixes that should never be hooked by WhichKey
--    -- this is mostly relevant for keymaps that start with a native binding
--    i = { "j", "k" },
--    v = { "j", "k" },
--  },
--  -- disable the WhichKey popup for certain buf types and file types.
--  -- Disabled by deafult for Telescope
--  disable = {
--    buftypes = {},
--    filetypes = {},
--  },
-- }
