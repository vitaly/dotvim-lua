return {
  setup = function()
    local function redraw()
      vim.cmd [[redraw]]
    end

    local toggle = require 'lib.toggle'
    local toggle_concealcursor = toggle.toggler('o:concealcursor', { 'n', '' }, redraw)
    local toggle_conceallevel = toggle.toggler('o:conceallevel', { 0, 1, 2 }, redraw)
    local toggle_clipboard = toggle.toggler('o:clipboard', { 'unnamedplus', '' }, redraw)

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

    -- add diffmode keymaps
    local function diff_mode()
      -- PRINT { 'DIFF MODE ', vim.o.diff }
      vim.api.nvim_buf_set_keymap(0, 'n', ',dp', '<cmd>diffput<cr>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 'n', ',dg', '<cmd>diffget<cr>', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 'n', ',dn', ']c', { noremap = true, silent = true })
      vim.api.nvim_buf_set_keymap(0, 'n', ',dN', '[c', { noremap = true, silent = true })
      if not vim.o.diff then
        vim.api.nvim_buf_del_keymap(0, 'n', ',dp')
        vim.api.nvim_buf_del_keymap(0, 'n', ',dg')
        vim.api.nvim_buf_del_keymap(0, 'n', ',dn')
        vim.api.nvim_buf_del_keymap(0, 'n', ',dN')
      end
    end

    my.au.command('diffmode.maps', 'OptionSet', diff_mode, { pattern = 'diff' })
    diff_mode() -- need to call it on startup becase OptionSet isn't called when vim starts in diffmode

    -- n keymap --------------------------------------------------------------------
    require('which-key').register({

      ['<localleader>'] = {
        name = ',',

        ['<leader>'] = { '<cmd>w<cr>', 'Save' },

        e = {
          name = 'Eval',
        },
      },

      ['<leader>'] = {
        name = 'SPC',

        q = { '<cmd>qa<cr>', 'Quit all' },
        Q = {
          name = 'Quit / Session',
          Q = { '<cmd>qa!<cr>', 'Quit all!' },
        },
        x = { '<cmd>q<cr>', 'close window' },

        m = { '<cmd>messages<cr>', 'Messages' },
        M = { '<cmd>messages clear<cr>', 'Clear Messages' },

        n = { '<cmd>cn<cr>', 'Next' },
        p = { '<cmd>cp<cr>', 'Prev' },

        a = {
          name = 'App',
        },

        b = {
          name = 'Buffer',

          n = { '<cmd>bn<cr>', 'Next' },
          p = { '<cmd>bp<cr>', 'Prev' },
          d = { '<cmd>bd<cr>', 'Delete' },
        },

        f = {
          name = 'File',

          s = { '<cmd>w<cr>', 'Save' },
          a = { '<cmd>wa<cr>', 'Save All' },

          x = { [[<cmd>!chmod +x %<cr>]], 'Make executable' },

          e = {
            name = 'Edit',

            s = { [[<cmd>exe 'e' g:my_ROOT.'/scratch.lua'<cr>]], 'Scratch' },
            i = { [[<cmd>exe 'e' g:my_ROOT.'/init.lua'<cr>]], 'Init' },
            p = { [[<cmd>exe 'e' g:my_ROOT.'/lua/init/plugins.lua'<cr>]], 'Plugins' },
            o = { [[<cmd>exe 'e' g:my_ROOT.'/lua/init/options.lua'<cr>]], 'Options' },
            n = { [[<cmd>exe 'e' g:my_ROOT.'/NOTES.md'<cr>]], 'Notes' },
            k = { [[<cmd>exe 'e' g:my_ROOT.'/lua/layers/base/keymaps/maps.lua'<cr>]], 'Keymaps' },
            L = { [[<cmd>exe 'e' stdpath('cache').'/lsp.log'<cr>]], 'LSP log' },
          },
        },

        w = {
          name = 'Window',

          q = { '<cmd>q<cr>', 'Close' },

          ['<bar>'] = { [[<c-w><bar>]], 'Max Width' },
          ['_'] = { [[<c-w>_]], 'Max Height' },
          ['='] = { [[<c-w>=]], 'Rebalance' },

          x = { [[<c-w>x]], 'Swap' },

          K = { [[<c-w>K]], 'Move Up' },
          J = { [[<c-w>J]], 'Move Down' },
          H = { [[<c-w>H]], 'Move Left' },
          L = { [[<c-w>L]], 'Move Right' },

          t = { [[<c-w>T]], 'Move to new Tab' },

          s = { [[<cmd>split<cr><c-w>j]], 'Split' },
          ['-'] = { [[<cmd>split<cr><c-w>j]], 'Split' },

          v = { [[<cmd>vsplit<cr><c-w>l]], 'VSplit' },
          ['<bslash>'] = { [[<cmd>vsplit<cr><c-w>l]], 'VSplit' },

          o = { [[<c-w>o]], 'Only' },
        },

        S = {
          name = 'Status',
        },

        ['<tab>'] = {
          name = 'Tab',

          n = { [[<cmd>tabnew<cr>]], 'New' },
          [ [[<tab>]] ] = { [[<cmd>b#<cr>]], 'Last Buffer' },
        },

        v = {
          name = 'Vim',

          r = { [[<cmd>redraw!<cr>]], 'Redraw' },
        },

        Y = {
          name = 'Yank',

          p = { [[<cmd>let @*=expand("%")<cr>:echo "Copied file path to clipboard"<cr>]], 'File Path' },
          n = { [[<cmd>let @*=expand("%:t")<cr>:echo "Copied file name to clipboard"<cr>]], 'File Name' },
          d = { [[<cmd>let @*=expand("%:h")<cr>:echo "Copied file directory to clipboard"<cr>]], 'File Directory' },
          ['.'] = { [[<cmd>let @*=getcwd()<cr>:echo @*<cr>]], 'Current Directory' },
        },
      },

      -- toggles
      ['\\'] = {
        name = 'Toggle',

        n = {
          name = 'Conceal',
          c = { toggle_concealcursor, 'Cursor' },
          n = { toggle_conceallevel, 'Level' },
        },

        d = {
          name = 'Debug',
          v = { toggle_verboselog, 'Vim Verbose Log' },
        },

        w = { '<cmd>set nolist!<cr>', 'White Space' },
        r = { '<cmd>set relativenumber!<cr>', 'Relative Number' },
        s = { '<cmd>setlocal spell!<cr>', 'Spell Check' },
        o = { '<cmd>set ro!<cr>', 'Read Only' },
        c = { toggle_clipboard, 'clipboard' },

        ["'"] = {
          name = 'Misc',
        },
      },
    }, { mode = 'n' })

    -- -- x keymap --------------------------------------------------------------------
    require('which-key').register({

      ['<leader>'] = {
        q = {
          name = 'Quit / Session',
          q = { '<cmd>qa<cr>', 'quit all' },
          Q = { '<cmd>qa!<cr>', 'quit all!' },
        },
        Q = { '<cmd>qa!<cr>', 'quit all!' },
        x = { '<cmd>q<cr>', 'close window' },
      },
    }, { mode = 'x' })
  end,
}
