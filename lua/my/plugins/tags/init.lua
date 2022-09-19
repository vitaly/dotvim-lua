local configs = {

  vista = {
    'liuchengxu/vista.vim', -- https://github.com/liuchengxu/vista.vim
    config = function()
      require 'my.plugins.tags.vista-config'
    end,
  },

  soutline = {
    'simrat39/symbols-outline.nvim', -- https://github.com/simrat39/symbols-outline.nvim

    cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },

    setup = function()
      require 'my.plugins.tags.symbols-outline-setup'
    end,
  },

  sidebar = {
    'sidebar-nvim/sidebar.nvim', -- https://github.com/sidebar-nvim/sidebar.nvim

    config = function() end,
  },
}

return configs.soutline
