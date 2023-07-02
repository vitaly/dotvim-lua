local debug = my.log.debug
return {
  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- FOLDLINE styling
  {
    'jrudess/vim-foldtext', -- https://github.com/jrudess/vim-foldtext
    event = { 'BufReadPost', 'BufNewFile' },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- REMEMBER LAST FILE LOCATION
  { 'ethanholz/nvim-lastplace', opts = {} }, -- https://github.com/ethanholz/nvim-lastplace

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- BOOKMARKS
  {
    'MattesGroeger/vim-bookmarks', -- https://github.com/MattesGroeger/vim-bookmarks
    opts = {
      bookmark_highlight_lines = true,
      bookmark_center = true,
      bookmark_display_annotation = true,
      bookmark_auto_close = true,
    },
    config = function(_, opts)
      vim.g.bookmark_highlight_lines = opts.bookmark_highlight_lines and 1 or 0
      vim.g.bookmark_center = opts.bookmark_center and 1 or 0
      vim.g.bookmark_display_annotation = opts.bookmark_display_annotation and 1 or 0
      vim.g.bookmark_auto_close = opts.bookmark_auto_close and 1 or 0
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- UndoTree
  {
    'mbbill/undotree', -- http://github.com/mbbill/undotree
    event = { 'BufReadPost', 'BufNewFile' },

    keys = {
      { [[g=]], [[<cmd>later<cr>]], desc = 'Go to newer text state' },
      { [[\u]], '<cmd>UndotreeToggle<cr>', desc = 'Undo Tree' },
    },

    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- WINDOW ZOOM
  -- Toggle current window zoom
  {
    'troydm/zoomwintab.vim', -- https://github.com/troydm/zoomwintab.vim

    keys = {
      { [[\z]], '<cmd>ZoomWinTabToggle<cr>', desc = 'Zoom' },
    },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- SWITCH
  {
    'AndrewRadev/switch.vim', -- https://github.com/AndrewRadev/switch.vim

    keys = { 'gs' },
    cmd = { 'Switch', 'SwitchExtend', 'SwitchRevers' },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- ALIGN
  { 'echasnovski/mini.align', version = '*', opts = {} }, -- https://github.com/echasnovski/mini.align

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- SEARCH AND REPLACE
  {
    'vim-scripts/greplace.vim', -- https://github.com/vim-scripts/greplace.vim
    cmd = { 'Gsearch', 'Gbuffersearch', 'Greplace' },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  ---ZEM MODE
  {
    'folke/twilight.nvim', -- https://github.com/folke/twilight.nvim

    keys = {
      { [[\F]], '<cmd>Twilight<cr>', desc = 'Focus' },
    },

    opts = {
      dimming = {
        alpha = 0.6,
        inactive = true,
      },
      context = 25,
    },
  },
  {
    'folke/zen-mode.nvim', -- https://github.com/folke/zen-mode.nvim

    keys = {
      { [[\<tab>]], '<cmd>ZenMode<cr>', desc = 'ZenMode' },
    },

    opts = {
      window = {
        backdrop = 0.6,
        width = 150, -- width of the Zen window
        options = {
          foldcolumn = '0', -- disable fold column
          list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- tmux = { enabled = true },
        -- kitty = {
        --   enabled = true,
        --   font = '+5',
        -- },
      },
    },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- Multi Cursors
  {
    'mg979/vim-visual-multi', -- https://github.com/mg979/vim-visual-multi

    init = function()
      -- Visual Cursor maps go under `,v`
      vim.g.VM_leader = '<localleader>v'
      vim.g.VM_highlight_matches = 'red'

      require('lib.tools').keymap_group([[<localleader>v]], 'Visual Multi')
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- STATUS COLUMN
  {
    'luukvbaal/statuscol.nvim', -- https://github.com/luukvbaal/statuscol.nvim
    config = function()
      local builtin = require 'statuscol.builtin'

      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      require('statuscol').setup {
        relculright = true,
        segments = {
          { text = { '%s' }, click = 'v:lua.ScSa' },
          { text = { builtin.lnumfunc, ' ' } },
          { text = { builtin.foldfunc, '│' }, click = 'v:lua.ScFa' },
        },
      }
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- ILLUMINATE WORDS UNDER CURSOR
  {
    'RRethy/vim-illuminate', -- https://github.com/RRethy/vim-illuminate
    event = { 'BufReadPost', 'BufNewFile' },
  },
}
