return function()
  return {
    on_attach = function(client, bufnr)
      local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
      end
      -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      -- Enable completion triggered by <c-x><c-o>
      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      require('lsp_signature').on_attach()
      require('folding').on_attach()

      vim.cmd [[
    hi LspReferenceText cterm=inverse gui=inverse
    hi LspReferenceRead cterm=inverse gui=inverse
    hi LspReferenceWrite cterm=inverse gui=inverse
    ]]

      if client.resolved_capabilities.document_highlight == true then
        vim.cmd [[
      augroup lsp_highlight
      au CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      au CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]]
      end

      vim.cmd [[
    augroup lsp_bulb
    au CursorHold,CursorHoldI <buffer> lua require"nvim-lightbulb".update_lightbulb {sign = {enabled = false}, virtual_text = {enabled = true, text = ""}, float = {enabled = false, text = "", win_opts = {winblend = 100, anchor = "NE"}}}
    augroup END
    ]]

      nmap({ 'buffer' }, 'gd', '<plug>Goto(definitions)')
      nmap({ 'buffer' }, 'gD', '<plug>Goto(declaration)')
      nmap({ 'buffer' }, 'gr', '<plug>Goto(references)')
      nmap({ 'buffer' }, 'gT', '<plug>Goto(type)')

      nmap({ 'buffer' }, '<localleader>rr', '<plug>Refactor(rename)')
      nmap({ 'buffer' }, '<localleader>a', '<plug>Code(actions)')
      nmap({ 'buffer' }, 'K', '<plug>Hover()')
      nmap({ 'buffer' }, '<localleader>1', '<plug>Goto(first)')
      nmap({ 'buffer' }, '<localleader>n', '<plug>Goto(next)')
      nmap({ 'buffer' }, '<localleader>p', '<plug>Goto(previous)')
    end,

    flags = { debounce_text_changes = 150 },
  }
end
