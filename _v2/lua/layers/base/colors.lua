-- lua/layers/base/colors.lua
--
-- NOTE: new base16 doesn't update .vimrc_background file
-- instead we have a BASE16_HOOK doing it instead

return {
  'RRethy/nvim-base16', -- https://github.com/RRethy/nvim-base16

  config = function()
    -- I don't like the way base16 colorschemes setup diffmode styling
    -- let's make sure that added/deleted/changed lines have a green/red/blue background
    local function diffmode_colors()
      local base16 = require 'base16-colorscheme'
      local colors = base16.colors
      local hi = base16.highlight

      if colors then
        -- 'colors' only available when a base16 colorscheme is set in vim
        hi.DiffDelete = { guibg = colors.base00, guifg = colors.base08, gui = nil, guisp = nil }
        hi.DiffAdd = { guibg = colors.base0B, guifg = colors.base00, gui = nil, guisp = nil }
        hi.DiffChange = { guibg = colors.base0A, guifg = colors.base00, gui = nil, guisp = nil }
        hi.DiffText = { guibg = colors.base0B, guifg = colors.base00, gui = nil, guisp = nil }
      end
    end

    my.au.on_colorscheme('diffmode.colors', diffmode_colors, { pattern = 'base16-*' })

    -- command to (re)load vim background from `~/.vimrc_background`
    cmdbang('LoadVimrcBackground', function()
      vim.cmd [[
        if filereadable(expand("~/.vimrc_background"))
          try | source ~/.vimrc_background | catch | echo "colorscheme load error" | endtry
        endif
      ]]
    end)

    -- load vim background on startup
    vim.cmd [[LoadVimrcBackground]]

    nnoremap('<plug>(Vim/Update-Colors)', ':LoadVimrcBackground<CR>')
    nmap('<leader>vc', '<plug>(Vim/Update-Colors)', 'silent')
  end,
}
