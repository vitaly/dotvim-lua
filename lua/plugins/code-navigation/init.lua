return {
  -- NOTE: Aerial is used through a Telescope popup
  ------------------------------------------------------------------------------
  -- AERIAL
  ------------------------------------------------------------------------------
  ---NOTE: Aerial is only used for the `go` popup. remove once adequate alternative found
  {
    'stevearc/aerial.nvim', -- https://github.com/stevearc/aerial.nvim

    requires = {
      'nvim-telescope/telescope.nvim',
    },

    keys = {
      { [[go]], '<cmd>Telescope aerial theme=cursor layout_config={height=20}<cr>', desc = 'Fuzzy Outline' },
    },

    cmd = { 'AerialOpen', 'AerialOpenAll', 'AerialClose', 'AerialCloseAll', 'AerialInfo' },

    opts = {
      layout = {
        default_direction = my.config.tagbar.position or 'right',
      },
    },

    config = function(_, opts)
      require('aerial').setup(opts)
      require('telescope').load_extension('aerial')
    end,
  },

  ------------------------------------------------------------------------------
  -- NEW SYMBOLS OUTLINE
  ------------------------------------------------------------------------------
  {
    'hedyhli/outline.nvim', -- https://github.com/hedyhli/outline.nvim

    enabled = false,
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
      { [[\t]], vim.cmd.Outline, desc = 'Symbols Outline' },
    },

    opts = {},
  },
}
