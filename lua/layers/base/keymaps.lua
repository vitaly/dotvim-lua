-- TODO: finish commented parts
return {
  {
    'b0o/mapx.nvim',                           -- https://github.com/b0o/mapx.nvim
  },
  {
    'folke/which-key.nvim',                    -- https://github.com/folke/which-key.nvim

    config = function()
      vim.opt.timeoutlen = 500 -- 0.5s before keymap menu
      local which_key = require 'which-key'

      which_key.setup {
        -- plugins = {
        --   marks = true, -- shows a list of your marks on ' and `
        --   registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        --   spelling = {
        --     enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        --     suggestions = 20, -- how many suggestions should be shown in the list?
        --   },
        --   -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        --   -- No actual key bindings are created
        --   presets = {
        --     operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        --     motions = true, -- adds help for motions
        --     text_objects = true, -- help for text objects triggered after entering an operator
        --     windows = true, -- default bindings on <c-w>
        --     nav = true, -- misc bindings to work with windows
        --     z = true, -- bindings for folds, spelling and others prefixed with z
        --     g = true, -- bindings for prefixed with g
        --   },
        -- },
        -- -- add operators that will trigger motion and text object completion
        -- -- to enable all native operators, set the preset / operators plugin above
        -- operators = { gc = "Comments" },
        -- key_labels = {
        --   -- override the label used to display some keys. It doesn't effect WK in any other way.
        --   -- For example:
        --   -- ["<space>"] = "SPC",
        --   -- ["<cr>"] = "RET",
        --   -- ["<tab>"] = "TAB",
        -- },
        -- icons = {
        --   breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        --   separator = "➜", -- symbol used between a key and it's label
        --   group = "+", -- symbol prepended to a group
        -- },
        -- popup_mappings = {
        --   scroll_down = '<c-d>', -- binding to scroll down inside the popup
        --   scroll_up = '<c-u>', -- binding to scroll up inside the popup
        -- },
        window = {
          -- border = "none", -- none, single, double, shadow
          border = 'single',
          -- position = "bottom", -- bottom, top
          -- margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
          -- padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          -- winblend = 0
        },
        -- layout = {
        --   height = { min = 4, max = 25 }, -- min and max height of the columns
        --   width = { min = 20, max = 50 }, -- min and max width of the columns
        --   spacing = 3, -- spacing between columns
        --   align = "left", -- align columns left, center or right
        -- },
        -- ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
        hidden = { '<silent>', '<cmd>', '<Cmd>', '<cr>', '<CR>', 'call ', 'lua ', '<C-U>', '^:', '^ ', '<Plug>' },
        -- show_help = true, -- show help message on the command line when the popup is visible
        -- triggers = "auto", -- automatically setup triggers
        -- -- triggers = {"<leader>"} -- or specify a list manually
        -- triggers_blacklist = {
        --   -- list of mode / prefixes that should never be hooked by WhichKey
        --   -- this is mostly relevant for key maps that start with a native binding
        --   -- most people should not need to change this
        --   i = { "j", "k" },
        --   v = { "j", "k" },
        -- },
        -- -- disable the WhichKey popup for certain buf types and file types.
        -- -- Disabled by deafult for Telescope
        disable = {
          -- buftypes = {},
          filetypes = { "TelescopePrompt" },
        },
      }

      local function redraw()
        vim.cmd [[redraw]]
      end

      local toggle = require 'my.toggle'

      local toggle_concealcursor = toggle({ states = { 'n', '' }, o = 'concealcursor', on = redraw }).toggler
      local toggle_conceallevel = toggle({ states = { 0, 1, 2 }, o = 'conceallevel', on = redraw }).toggler
      local toggle_clipboard = toggle({ states = { 'unnamedplus', '' }, o = 'clipboard', on = redraw }).toggler

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

      -- n keymap --------------------------------------------------------------------
      which_key.register({

        ['<leader>'] = {
          name = 'SPC',

          q = { '<cmd>qa<cr>', 'quit all' },
          Q = { '<cmd>qa!<cr>', 'quit all!' },
          x = { '<cmd>q<cr>', 'close window' },

          m = { '<cmd>messages<cr>', 'Messages' },
          M = { '<cmd>messages<cr>', 'Clear Messages' },

          n = { '<cmd>cn<cr>', 'Next' },
          p = { '<cmd>cp<cr>', 'Prev' },



          R = { '<cmd>PackerCompile<cr>', 'Recompile configuration' },

          -- FIXME: move to comment
          --     [';'] = { '<plug>Toggle(comment)', 'Toggle Comment' },

          a = {
            name = 'App',
            p = {
              name = 'Packer',

              s = { '<cmd>PackerStatus<cr>', 'Status' },
              c = { '<cmd>PackerCompile<cr>', 'Compile' },
              i = { '<cmd>PackerInstall<cr>', 'Install' },
              u = { '<cmd>PackerUpdate<cr>', 'Update' },

              S = { '<cmd>PackerSync<cr>', 'Sync' },
              C = { '<cmd>PackerClean<cr>', 'Clean' },



            },
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
              p = { [[<cmd>exe 'e' g:my_ROOT.'/lua/plugins.lua'<cr>]], 'Plugins' },
              o = { [[<cmd>exe 'e' g:my_ROOT.'/lua/init/options.lua'<cr>]], 'Options' },
              n = { [[<cmd>exe 'e' g:my_ROOT.'/NOTES.md'<cr>]], 'Notes' },
              k = { [[<cmd>exe 'e' g:my_ROOT.'/lua/layers/base/keymaps.lua'<cr>]], 'Keymaps' },
              L = { [[<cmd>exe 'e' stdpath('cache').'/lsp.log'<cr>]], 'LSP log'}
            },
          },


          w = {
            name = 'Window',

            q = { '<cmd>q<cr>', 'Close' },

            ['<bar>'] = { [[<c-w><bar>]], 'Max Width' },
            ['_'] = { [[<c-w>_]], 'Max Height' },
            ['='] = { [[<c-w>=]], 'Rebalance'} ,

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


          t = {
            name = 'Tab',

            n = { [[<cmd>tabnew<cr>]], 'New' },
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



      --     g = { name = 'Git' },
      --     d = { name = 'Debug' },
        },

        ['<localleader>'] = {
          name = ',',

          ['<leader>'] = { '<cmd>w<cr>', 'Save' },

          e = {
            name = 'Eval',
          },
        },

        --   FIXME: move to comment
      --   g = {
      --     c = {
      --       name = 'Comment',
      --       c = 'Toggle Comment',
      --     },
      --   },

        -- toggles
        ['\\'] = {
          name = 'Toggle',

        --   FIXME: move to debug
      --     d = {
      --       name = 'Debug',
      --     },

          n = {
            name = 'Conceal',
            c = { toggle_concealcursor, 'Cursor' },
            n = { toggle_conceallevel, 'Level' },
          },

          l = { toggle_verboselog, 'Verbose Log' },
          w = { '<cmd>set nolist!<cr>', 'White Space' },
          r = { '<cmd>set relativenumber!<cr>', 'Relative Number' },
          s = { '<cmd>setlocal spell!<cr>', 'Spell Check' },
          o = { '<cmd>set ro!<cr>', 'Read Only' },
          c = { toggle_clipboard, 'clipboard' },
        },
      }, { mode = 'n' })

      -- -- x keymap --------------------------------------------------------------------
      which_key.register({
      --   g = {
      --     -- XXX: this doesn't work. it adds a duplicate in the menu
      --     c = 'Toggle Comment',
      --   },

        ['<leader>'] = {

          q = { '<cmd>qa<cr>', 'quit all' },
          Q = { '<cmd>qa!<cr>', 'quit all!' },
          x = { '<cmd>q<cr>', 'close window' },
      --     [';'] = { '<plug>Toggle(comment)', 'Toggle Comment' },
        },
      }, { mode = 'x' })

    end,
  },
}
