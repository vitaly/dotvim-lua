local colorizer = {}
colorizer.attached = function()
  return require('colorizer').is_buffer_attached(0)
end

colorizer.attach = function()
  if not colorizer.attached() then
    local opts = require('lazy.core.config').plugins['nvim-colorizer.lua'].opts or {}
    require('colorizer').attach_to_buffer(0, {
      mode = vim.g.colorizer_mode or opts.user_default_options.mode,
    })
  end
end

colorizer.detach = function()
  if colorizer.attached() then
    require('colorizer').detach_from_buffer(0)
  end
end

colorizer.reload = function()
  require('colorizer').reload_all_buffers()
end

colorizer.toggle = function()
  if colorizer.attached() then
    colorizer.detach()
  else
    colorizer.attach()
  end
end

colorizer.mode_toggler = require('lib.toggle').toggler('g:colorizer_mode', { 'virtualtext', 'foreground', 'background' })
colorizer.toggle_mode = function()
  colorizer.detach()
  colorizer.mode_toggler()
  colorizer.attach()
  colorizer.reload()
end

return {

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- COLORIZ#E#R
  -- highlights colors in the sources
  -- e.g. things like #ff00ff
  require('lib.tools').register_keymap_groups {
    [ [[\C]] ] = { name = 'Colorizer' },
  }, -- register menu group
  {
    -- 'norcalli/nvim-colorizer.lua', -- https://github.com/norcalli/nvim-colorizer.lua
    'NvChad/nvim-colorizer.lua', -- https://github.com/NvChad/nvim-colorizer.lua
    event = { 'BufReadPost', 'BufNewFile' },

    keys = {
      { [[\Cc]], colorizer.toggle, desc = 'Toggle Colorizer' },
      { [[\Cm]], colorizer.toggle_mode, desc = 'Toggle Colorizer Mode' },
      { [[\Cr]], colorizer.reload, desc = 'Reload Colorizer' },
    },

    opts = { user_default_options = { mode = 'virtualtext' } },
  },
  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- Interesting Words
  -- Highlight custom words in document
  {
    'lfv89/vim-interestingwords', -- https://github.com/lfv89/vim-interestingwords
    opts = {
      colors = {
        '#ff0000',
        '#00ff00',
        '#0000ff',
        '#ffff00',
        '#00ffff',
        '#ff00ff',
        '#888888',
        '#880000',
        '#008800',
        '#000088',
        '#888800',
        '#008888',
        '#880088',
        '#8800ff',
        '#88aaff',
        '#ff8800',
        '#ff4488',
        '#ffffff',
      },
    },
    init = function(plugin)
      if plugin.opts.colors then
        vim.g.interestingWordsGUIColors = plugin.opts.colors
      end
      -- vim.g.interestingWordsRandomiseColors = 1
    end,
    keys = {
      { 'n', '<cmd>call WordNavigation(1)<cr><cmd>set hls<cr>zz', desc = 'Search Next' },
      { 'N', '<cmd>call WordNavigation(0)<cr><cmd>set hls<cr>zz', desc = 'Search Next' },
    },
    config = function() end,
  },
}
