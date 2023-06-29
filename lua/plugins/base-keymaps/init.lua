---------------------------------------------------------------------------------
-- returns mapping for given key to edit file with given path
---------------------------------------------------------------------------------
local function edit_file_map(key, path, name)
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
-- DIFF MODE MAPS
---------------------------------------------------------------------------------
local function setup_diff_mode_maps()
  -- add diffmode keymaps
  local diff_mode = function()
    vim.keymap.set('n', ',dp', '<cmd>diffput<cr>', { buffer = 0, silent = true, desc = 'Diff Put' })
    vim.keymap.set('n', ',dg', '<cmd>diffget<cr>', { buffer = 0, silent = true, desc = 'Diff Get' })
    vim.keymap.set('n', ',dn', ']c', { buffer = 0, silent = true, desc = 'Next Diff' })
    vim.keymap.set('n', ',dN', '[c', { buffer = 0, silent = true, desc = 'Prev Diff' })

    if not vim.o.diff then
      vim.keymap.del('n', ',dp', { buffer = 0 })
      vim.keymap.del('n', ',dg', { buffer = 0 })
      vim.keymap.del('n', ',dn', { buffer = 0 })
      vim.keymap.del('n', ',dN', { buffer = 0 })
    end
  end

  require('lib.au').command('diffmode.maps', 'OptionSet', diff_mode, { pattern = 'diff' })
  diff_mode() -- need to call it on startup becase OptionSet isn't called when vim starts in diffmode
end

---------------------------------------------------------------------------------
-- PLUGIN CONFIG
---------------------------------------------------------------------------------
return {
  'folke/which-key.nvim', -- https://github.com/folke/which-key.nvim

  event = 'VeryLazy',

  keys = {

    -- quiting
    { '<leader>qq', '<cmd>qa<cr>', mode = { 'n', 'x' }, desc = 'Quit All' },
    { '<leader>qQ', '<cmd>qa!<cr>', mode = { 'n', 'x' }, desc = 'Quit All!' },
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
    { '<leader><tab><tab>', '<plug>(Last-Buffer)' },

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
    edit_file_map('<leader>fek', '/lua/plugins/base-keymaps/init.lua', 'Keymaps'),
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

    -- terminal

    { '<a-[>', '<c-\\><c-n>', mode = 't', desc = 'Switch To Normal Mode ' },

    -- misc

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
      [ [[<localleader>]] ] = {
        name = ',',

        e = { name = 'Eval' },
      },

      [ [[<leader>]] ] = {
        name = 'SPC',

        S = { name = 'Status / Show' },
        Y = { name = 'Yank' },
        a = { name = 'App' },
        b = { name = 'Buffer' },
        f = { name = 'File' },
        fe = { name = 'File Edit' },
        q = { name = 'Quit / Session' },
        v = { name = 'Vim' },
        w = { name = 'Window' },

        [ [[<tab>]] ] = { name = 'Tab' },
      },

      [ [[\]] ] = {
        name = 'Toggle',

        n = { name = 'Conceal' },
        d = { name = 'Debug' },

        ["'"] = { name = 'Misc' },
      },
    },
  },

  config = function(_, opts)
    vim.opt.timeoutlen = 500 -- 0.5s before keymap menu
    require('which-key').setup(opts)
    require('which-key').register(opts.register, { mode = { 'n', 'v' } })

    setup_diff_mode_maps()
  end,
}
