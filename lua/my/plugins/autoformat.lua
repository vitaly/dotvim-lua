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
          cmd = { 'stylua --search-parent-directories' },
        },
      },

      javascript = {
        { cmd = { 'npx prettier -w' } },
      },
    }

    vim.g.format_debug = false
    local function toggle_format_debug()
      if vim.o.format_debug then
        vim.o.format_debug = false
      else
        vim.o.format_debug = true
      end
    end

    local which_key = require 'which-key'

    which_key.register {
      ['<leader>T'] = {
        F = { toggle_format_debug, 'Format debug' },
      },
    }
  end,
}
