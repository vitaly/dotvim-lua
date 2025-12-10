local config = require('onion.config')
config.set_defaults('tagbar', {
  position = 'right',
})

return {
  ------------------------------------------------------------------------------
  -- AERIAL
  ------------------------------------------------------------------------------
  ---NOTE: Aerial is only used for the `go` popup. remove once adequate alternative found
  {
    'stevearc/aerial.nvim', -- https://github.com/stevearc/aerial.nvim

    dependencies = {
      'nvim-telescope/telescope.nvim',
    },

    keys = {
      { [[go]], '<cmd>Telescope aerial theme=cursor layout_config={height=20}<cr>', desc = 'Fuzzy Outline' },
    },

    cmd = { 'AerialOpen', 'AerialOpenAll', 'AerialClose', 'AerialCloseAll', 'AerialInfo' },

    opts = {
      layout = {
        default_direction = config.get('tagbar.position') or 'right',
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

    enabled = true,
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
      { [[\t]], vim.cmd.Outline, desc = 'Symbols Outline' },
    },

    opts = {
      keymaps = {
        goto_location = { '<cr>', '<2-leftmouse>' },
      },
    },
  },
}
