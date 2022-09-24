-- lua/layers/filer/base.lua

return {
  setup = function(opts)
    local function toggle_or_reveal()
      if vim.o.buflisted and '' ~= vim.fn.expand '%:p' then
        opts.reveal()
      else
        opts.toggle()
      end
    end

    require('which-key').register {
      ['\\'] = {
        ['\\'] = { toggle_or_reveal, 'Toggle / Reveal File' },

        ['['] = { opts.toggle, 'Toggle File Tree' },
      },
    }
  end,
}
