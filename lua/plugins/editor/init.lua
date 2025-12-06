-- local debug = my.log.debug
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

    init = function() vim.g.undotree_SetFocusWhenToggle = 1 end,
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
  { 'nvim-mini/mini.align', version = '*', opts = {} }, -- https://github.com/nvim-mini/mini.align

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- INDENT SCOPE
  {
    'nvim-mini/mini.indentscope', -- https://github.com/nvim-mini/mini.indentscope/tree/main
    version = '*',

    keys = {
      {
        [[\i]],
        function() vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable end,
        desc = 'Indent Scope',
      },
    },

    init = function() vim.g.miniindentscope_disable = true end,

    opts = {
      symbol = '┊',
    },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- SEARCH AND REPLACE
  {
    'vim-scripts/greplace.vim', -- https://github.com/vim-scripts/greplace.vim
    cmd = { 'Gsearch', 'Gbuffersearch', 'Greplace' },
  },

  {
    'nvim-pack/nvim-spectre', -- https://github.com/nvim-pack/nvim-spectre
    opts = {},
    enabled = true,

    keys = {
      { '<leader>sr', '<cmd>lua require("spectre").open()<cr>', desc = 'Search and Replace' },
    },
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

      require('which-key').add({ [[<localleader>v]], group = 'Visual Multi', mode = 'nv' })
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- STATUS COLUMN
  -- NOTE: Folding config is in lua/plugins/editor-folding/init.lua
  {
    'luukvbaal/statuscol.nvim', -- https://github.com/luukvbaal/statuscol.nvim
    config = function()
      local builtin = require('statuscol.builtin')

      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      require('statuscol').setup({
        relculright = true,
        segments = {
          { text = { '%s' }, click = 'v:lua.ScSa' },
          { text = { builtin.lnumfunc, ' ' } },
          { text = { builtin.foldfunc, '│' }, click = 'v:lua.ScFa' },
        },
      })
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- ILLUMINATE WORDS UNDER CURSOR
  {
    'RRethy/vim-illuminate', -- https://github.com/RRethy/vim-illuminate
    event = { 'BufReadPost', 'BufNewFile' },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- YANK RING
  {
    'gbprod/yanky.nvim', -- https://github.com/gbprod/yanky.nvim
    opts = {},
    lazy = false,
    keys = {
      { [[p]], '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Paste after' },
      { [[P]], '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Paste before' },
      { [[gp]], '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Paste after' },
      { [[gP]], '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Paste before' },
      { ']y', '<Plug>(YankyCycleBackward)', desc = 'Paste Cycle Back' },
      { '[y', '<Plug>(YankyCycleForward)', desc = 'Paste Cycle Next' },
      { [[<leader>Y<cr>]], vim.cmd.YankyRingHistory, desc = 'Yank History' },
    },

    config = true,
  },
  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  --- VENN DIAGRAMS IN NEOVIM
  {
    'jbyuki/venn.nvim', -- https://github.com/jbyuki/venn.nvim
    keys = {
      { [[\V]], "<cmd>lua require('venn.toggle').toggle()<cr>", mode = { 'n', 'x' }, desc = 'Toggle Venn' },
    },
    config = function()
      package.loaded['venn.toggle'] = {

        toggle = function()
          if vim.b.venn_enabled then
            vim.b.venn_enabled = false
            vim.keymap.del('n', 'J', { buffer = true })
            vim.keymap.del('n', 'K', { buffer = true })
            vim.keymap.del('n', 'H', { buffer = true })
            vim.keymap.del('n', 'L', { buffer = true })
            vim.keymap.del('n', 'f', { buffer = true })
            print('Venn disabled')
            return
          end

          vim.b.venn_enabled = true

          vim.keymap.set('n', 'J', '<c-v>j:VBox<cr>', { buffer = true })
          vim.keymap.set('n', 'K', '<c-v>k:VBox<cr>', { buffer = true })
          vim.keymap.set('n', 'H', '<c-v>h:VBox<cr>', { buffer = true })
          vim.keymap.set('n', 'L', '<c-v>l:VBox<cr>', { buffer = true })

          vim.keymap.set('v', 'f', '<cmd>VBox<cr>', { buffer = true })
          print('Venn enabled')
        end,
      }
    end,
  },
}
