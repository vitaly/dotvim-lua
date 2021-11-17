-- https://github.com/lukas-reineke/format.nvim
return {
  'lukas-reineke/format.nvim',

  config = function()
    require('format').setup {

      vim = {
        {
          cmd = { 'stylua' },
          start_pattern = '^lua << LUA$',
          end_pattern = '^LUA$',
        },
      },

      lua = {
        {
          cmd = { 'stylua', '--search-parent-directoried' },
        },
      },
    }
  end,
}
