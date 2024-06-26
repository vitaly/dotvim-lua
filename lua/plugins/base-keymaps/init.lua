local util = require 'plugins.base-keymaps.utils'
local debug = my.log.debug
local trace = my.log.trace

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
    -- lazy
    { '<leader>l', '<cmd>Lazy home<cr>', desc = 'Lazy' },

    { '<leader>azC', '<cmd>Lazy clear<cr>', desc = 'Clear' },
    { '<leader>azL', ':<c-u>Lazy load ', desc = 'Load...' },
    { '<leader>azR', '<cmd>Lazy restore<cr>', desc = 'Restore' },
    { '<leader>azb', '<cmd>Lazy build<cr>', desc = 'Build' },
    { '<leader>azd', '<cmd>Lazy debug<cr>', desc = 'Debug' },
    { '<leader>azh', '<cmd>Lazy health<cr>', desc = 'Health' },
    { '<leader>azk', '<cmd>Lazy check<cr>', desc = 'Check' },
    { '<leader>azl', '<cmd>Lazy log<cr>', desc = 'Log' },
    { '<leader>azp', '<cmd>Lazy profile<cr>', desc = 'Profile' },
    { '<leader>azr', ':<c-u>Lazy reload ', desc = 'Reload...' },
    { '<leader>azu', ':<c-u>Lazy update ', desc = 'Update...' },
    { '<leader>azs', '<cmd>Lazy sync<cr>', desc = 'Sync' },

    -- quiting
    { [[<leader>q]], '<cmd>qa<cr>', mode = { 'n', 'x' }, desc = 'Quit All' },
    { [[<leader>QQ]], '<cmd>qa!<cr>', mode = { 'n', 'x' }, desc = 'Quit All!' },
    { [[<leader>x]], '<cmd>q<cr>', mode = { 'n', 'x' }, desc = 'Close Window' },
    { [[<leader>wq]], '<cmd>q<cr>', mode = { 'n', 'x' }, desc = 'Close Window' },

    { [[<localleader><leader>]], '<cmd>w<cr>', desc = 'Save' },

    -- stylua: ignore start
    { [[[l]], function() util.next_indent(false, false, false, true) end, desc = 'Prev Indent', },
    { [[]l]], function() util.next_indent(false, true, false, true) end, desc = 'Next Indent', },
    { [[[L]], function() util.next_indent(false, false, true, true) end, desc = 'Prev Lower Indent', },
    { [[]L]], function() util.next_indent(false, true, true, true) end, desc = 'Next Lower Indent', },
    -- stylua: ignore end

    { [[<leader><space>]], ':' },

    { [[Q]], 'gw', mode = { 'n', 'v', 'o' } },

    { [[<tab><tab>]], '<cmd>b#<cr>', desc = 'Switch to last buffer' },

    { [[<]], '<gv', mode = 'x', desc = 'Keep selection after outdent' },
    { [[>]], '>gv', mode = 'x', desc = 'Keep selection after indent' },

    { [[j]], 'gj' },
    { [[k]], 'gk' },

    { [[+]], '<C-a>', desc = 'Increment' },
    { [[-]], '<C-x>', desc = 'Decrement' },

    { [[n]], 'nzz', desc = 'Search Next and Center' },
    { [[N]], 'Nzz', desc = 'Search Prev and Center' },
    { [[*]], '*zz', desc = 'Search Word and Center' },
    { [[#]], '#zz', desc = 'Search Word Back and Center' },
    { [[g*]], 'g*zz', desc = 'Search and Center' },
    { [[g#]], 'g#zz', desc = 'Search Back and Center' },

    -- fast expand current file's directory in command mode
    { [[%%]], [[<C-R>=expand('%:h').'/'<cr>]], mode = 'c', desc = 'Expand current file directory' },
    { [[%^]], [[<C-R>=expand('%:p:h').'/'<cr>]], mode = 'c', desc = 'Expand current absolute file directory' },

    -- move lines up/down
    { [[<C-j>]], ':m .+1<CR>==', desc = 'Move line down' },
    { [[<C-k>]], ':m .-2<CR>==', desc = 'Move line up' },
    { [[<C-j>]], ":m '>+1<CR>gv=gv", mode = 'x', desc = 'Move selected lines down' },
    { [[<C-k>]], ":m '<-2<CR>gv=gv", mode = 'x', desc = 'Move selected lines up' },

    { [[<esc>]], '<cmd>silent noh<cr>', silent = true, desc = 'Clear search highlight' },

    -- c-ghjk navigation
    { [[<c-k>]], '<up>', mode = { 'i', 'c' } },
    { [[<c-j>]], '<down>', mode = { 'i', 'c' } },
    { [[<c-h>]], '<left>', mode = { 'i' } },
    { [[<c-l>]], '<right>', mode = { 'i' } },

    -- messages
    { [[<leader>m]], '<cmd>messages<cr>', desc = 'Messages' },
    { [[<leader>M]], '<cmd>messages clear<cr>', desc = 'Clear Messages' },

    { [[<leader>n]], '<cmd>cn<cr>', desc = 'Next' },
    { [[<leader>p]], '<cmd>cp<cr>', desc = 'Prev' },

    -- buffer
    { [[<leader>bn]], '<cmd>bn<cr>', desc = 'Next Buffer' },
    { [[<leader>bp]], '<cmd>bp<cr>', desc = 'Prev Buffer' },
    { [[<leader>bd]], '<cmd>bd<cr>', desc = 'Delete Buffer' },

    -- file
    { [[<leader>fs]], '<cmd>w<cr>', desc = 'Save File' },
    { [[<leader>fa]], '<cmd>wa<cr>', desc = 'Save All Files' },
    { [[<leader>fx]], [[<cmd>!chmod +x %<cr>]], desc = 'Make Executable' },

    { [[<leader>feL]], [[<cmd>exe 'e' stdpath('cache').'/lsp.log'<cr>]], 'LSP log' },
    util.edit_file_map([[<leader>fec]], '/lua/init/config.lua', 'Config'),
    util.edit_file_map([[<leader>fei]], '/init.lua', 'Init'),
    util.edit_file_map([[<leader>fek]], '/lua/plugins/base-keymaps/init.lua', 'Keymaps'),
    util.edit_file_map([[<leader>feo]], '/lua/init/options.lua', 'Options'),
    util.edit_file_map([[<leader>fep]], '/lua/plugins', 'Plugins'),
    util.edit_file_map([[<leader>fer]], '/README.md', 'README'),
    util.edit_file_map([[<leader>fes]], '/scratch.lua', 'Scratch'),

    -- window
    { [[<leader>w<bar>]], [[<c-w><bar>]], desc = 'Max Width' },
    { [[<leader>w_]], [[<c-w>_]], desc = 'Max Height' },
    { [[<leader>w=]], [[<c-w>=]], desc = 'Rebalance' },

    { [[<leader>wx]], [[<c-w>x]], desc = 'Swap' },
    { [[<leader>wK]], [[<c-w>K]], desc = 'Move Up' },
    { [[<leader>wJ]], [[<c-w>J]], desc = 'Move Down' },
    { [[<leader>wH]], [[<c-w>H]], desc = 'Move Left' },
    { [[<leader>wL]], [[<c-w>L]], desc = 'Move Right' },

    { [[<leader>w-]], [[<cmd>split<cr>]], desc = 'Split' },
    { [[<leader>w<bslash>]], [[<cmd>vsplit<cr>]], desc = 'VSplit' },

    { [[<leader>wt]], [[<c-w>T]], desc = 'Move to new Tab' },
    { [[<leader>wo]], [[<c-w>o]], desc = 'Only' },

    -- terminal

    { [[<a-[>]], [[<c-\><c-n>]], mode = 't', desc = 'Switch To Normal Mode ' },

    -- misc

    { [[<tab>n]], [[<cmd>tabnew<cr>]], desc = 'New Tab' },

    { [[<leader>vr]], [[<cmd>redraw!<cr>]], desc = 'Redraw' },

    { [[<leader>Yp]], [[<cmd>let @*=expand("%")<cr>:echo "Copied file path to clipboard"<cr>]], desc = 'File Path' },
    { [[<leader>Yn]], [[<cmd>let @*=expand("%:t")<cr>:echo "Copied file name to clipboard"<cr>]], desc = 'File Name' },
    { [[<leader>Yd]], [[<cmd>let @*=expand("%:h")<cr>:echo "Copied file directory to clipboard"<cr>]], desc = 'File Directory' },
    { [[<leader>Y.]], [[<cmd>let @*=getcwd()<cr>:echo @*<cr>]], desc = 'Current Directory' },

    { [[\w]], [[<cmd>set nolist!<cr>]], desc = 'White Space' },
    { [[\r]], [[<cmd>set relativenumber!<cr>]], desc = 'Relative Number' },
    { [[\s]], [[<cmd>setlocal spell!<cr>]], desc = 'Spell Check' },
    { [[\o]], [[<cmd>set ro!<cr>]], desc = 'Read Only' },

    { [[\c]], util.toggle_clipboard, desc = 'clipboard' },

    { [[\nc]], util.toggle_concealcursor, desc = 'Cursor' },
    { [[\nn]], util.toggle_conceallevel, desc = 'Level' },

    { [[\dv]], util.toggle_verboselog, desc = 'Vim Verbose Log' },

    { [[\fc]], util.toggle_foldcolumn, desc = 'Toggle Fold Column' },

    { [[\lt]], [[<cmd>lua my.config.loglevel = 0<cr>]], desc = 'Loglevel 0 - TRACE' },
    { [[\ld]], [[<cmd>lua my.config.loglevel = 1<cr>]], desc = 'Loglevel 1 - DEBUG' },
    { [[\li]], [[<cmd>lua my.config.loglevel = 2<cr>]], desc = 'Loglevel 2 - INFO' },
    { [[\lw]], [[<cmd>lua my.config.loglevel = 3<cr>]], desc = 'Loglevel 3 - WARN' },
    { [[\le]], [[<cmd>lua my.config.loglevel = 4<cr>]], desc = 'Loglevel 4 - ERROR' },
    { [[\lo]], [[<cmd>lua my.config.loglevel = 5<cr>]], desc = 'Loglevel 5 - OFF' },

    { [[\ll]], [[<cmd>lua print(my.config.loglevel)<cr>)]], desc = 'Loglevel 5 - OFF' },
  },

  opts = {
    window = { border = 'single' },
    hidden = { '<silent>', '<cmd>', '<Cmd>', '<cr>', '<CR>', 'call ', 'lua ', '<C-U>', '^:', '^ ', '<Plug>' },
    disable = { filetypes = { 'TelescopePrompt' } },

    groups = {
      [ [[<leader>]] ] = {
        name = 'SPC',

        Q = { name = 'Quit / Session' },
        S = { name = 'Status / Show' },
        Y = { name = 'Yank' },
        a = { name = 'App' },
        b = { name = 'Buffer' },
        f = { name = 'File' },
        fe = { name = 'File Edit' },
        v = { name = 'Vim' },
        w = { name = 'Window' },
      },

      [ [[\]] ] = {
        name = 'Toggle',

        d = { name = 'Debug' },
        f = { name = 'Fold' },
        l = { name = 'Log' },
        n = { name = 'Conceal' },

        ["'"] = { name = 'Misc' },
      },
    },
  },

  config = function(_, opts)
    vim.opt.timeoutlen = 500 -- 0.5s before keymap menu
    require('which-key').setup(opts)
    require('which-key').register(opts.groups, { mode = { 'n', 'v' } })

    setup_diff_mode_maps()

    require('lib.tools').keymap_group([[<localleader>]], ',')
    require('lib.tools').keymap_group([[<localleader>e]], 'Eval')

    for _, group in ipairs(vim.g.my_keymap_groups) do
      trace('registering', group[1], group[2])
      require('which-key').register({ [group[1]] = { name = group[2] } }, group[3])
    end

    vim.g.my_keymap_groups_loaded = true
  end,
}
