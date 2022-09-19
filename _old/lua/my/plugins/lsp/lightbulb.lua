return {

  config = function()
    vim.cmd [[
      augroup lsp_bulb
      au CursorHold,CursorHoldI * lua require("my.plugins.lsp.lightbulb").update()
      augroup END
    ]]
  end,

  update = function()
    require('nvim-lightbulb').update_lightbulb {
      sign = { enabled = false },
      virtual_text = {
        enabled = true,
        text = '💡',
        hl_mode = 'combine',
      },
      float = { enabled = false, text = '', win_opts = { winblend = 100, anchor = 'NE' } },
    }
  end,
}
