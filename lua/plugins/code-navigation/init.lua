local outline = {
  'simrat39/symbols-outline.nvim', -- https://github.com/simrat39/symbols-outline.nvim

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },

  cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },

  keys = {
    { [[\t]], vim.cmd.SymbolsOutline, desc = 'SymbolsOutline' },
  },

  opts = {
    position = (my.config.tagbar or {}).position or 'right',
    autofold_depth = 2,
    --     width = 40,
    --     relative_width = false,
    --     auto_preview = false,
    winblend = 20,
    keymaps = {
      goto_location = { '<Cr>', '<2-LeftMouse>' },
      close = { 'q' }, -- only 'q', <esc> should not close
    },
  },

  config = function(_, opts)
    require('symbols-outline').setup(opts)

    vim.cmd [[
      hi! clear FocusedSymbol
      hi! FocusedSymbol gui=bold guifg=red
    ]]

    require('lib.au').command('outline_setup', 'FileType', function()
      vim.opt.foldcolumn = '0'
      vim.opt.signcolumn = 'auto'
    end, { pattern = 'Outline' })
  end,
}

local aerial = {
  'stevearc/aerial.nvim', -- https://github.com/stevearc/aerial.nvim

  requires = {
    'nvim-telescope/telescope.nvim',
  },

  keys = {
    { [[<leader>Sa]], vim.cmd.AerialInfo, desc = 'AerialInfo' },
    { [[go]], '<cmd>Telescope aerial theme=cursor layout_config={height=20}<cr>', desc = 'Fuzzy Outline' },
    -- { [[\t]], vim.cmd.AerialOpen, desc = 'SymbolsOutline' },
  },

  opts = {
    layout = {
      default_direction = my.config.tagbar.side or 'right',
    },
  },

  config = function(_, opts)
    require('aerial').setup(opts)

    -- FIXME: seems not to be needed on latest
    -- my.au.on_lsp_attach('aerial', require('aerial').on_attach)
    require('telescope').load_extension 'aerial'

    -- require('which-key').register {
    --   ['<leader>Sa'] = { '<cmd>AerialInfo<cr>', 'AerialInfo' },
    --
    --   -- ['\\t'] = { '<cmd>AerialOpen<cr>', 'Aerial Outline' },
    --   go = {},
    --   gO = { '<cmd>AerialOpen float<cr>', 'Outline' },
    -- }
  end,
}

return {
  aerial,
  outline,
}
