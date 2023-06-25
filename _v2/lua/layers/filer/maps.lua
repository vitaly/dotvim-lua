-- lua/layers/filer/maps.lua

return {
  setup = function(opts)
    local function toggle_or_reveal()
      if vim.o.buflisted and '' ~= vim.fn.expand '%:p' then
        opts.reveal()
      else
        opts.toggle()
      end
    end

    if opts.popup then
      require('which-key').register {
        ['\\'] = {
          ['\\'] = { opts.popup, 'Quick File Popup' },
          [']'] = { toggle_or_reveal, 'Toggle / Reveal File' },
          ['['] = { opts.toggle, 'Toggle File Tree' },
        },
      }
    else
      require('which-key').register {
        ['\\'] = { toggle_or_reveal, 'Toggle / Reveal File' },

        ['['] = { opts.toggle, 'Toggle File Tree' },
      }
    end
  end,
}
