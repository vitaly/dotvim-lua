return {
  {
    'editorconfig/editorconfig-vim',
    config = function()
      require 'my.toggle'
      local editorconfig_verbose_toggle = MakeSwitch({
        g = 'EditorConfig_verbose',
        states = { 0, 1 },
      }).toggler
      require('which-key').register {
        ['\\'] = {
          de = { editorconfig_verbose_toggle, 'Editorconfig' },
        },
      }
    end,
  },

  -- from https://alpha2phi.medium.com/neovim-plugins-for-a-better-coding-experience-part-3-d4c2df085677
  -- { 'nathom/filetype.nvim' }, -- https://github.com/nathom/filetype.nvim

  -- bookmarks

}
