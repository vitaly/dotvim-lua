return {
  setup = function()
    local dir = (_my.config.obsidian or {}).dir or '~/vault'
    -- print('obsidian dir = ' .. dir)
    require('obsidian').setup {
      -- dir = dir,
      completion = {
        nvim_cmp = true,
      },
    }
  end,
}
