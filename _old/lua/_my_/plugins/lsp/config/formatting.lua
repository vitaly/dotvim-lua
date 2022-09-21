if not _G.OriginalFormattingHandler then
  -- print 'saving formatting handler'
  _G.OriginalFormattingHandler = vim.lsp.handlers['textDocument/formatting']
  -- else
  -- print 'already saved formatting handler'
end
vim.lsp.handlers['textDocument/formatting'] = function(err, result, ctx, config)
  -- print 'on formatting'
  -- PRINT({ 'on_formatting', 'tick', vim.b.changedtick, 'config', config, 'ctx', ctx })
  -- local current_tick = vim.b.changedtick
  -- local start_tick = ctx.params.options.start_changedtick
  -- PRINT({'/formatting', start_tick, current_tick})
  -- PRINT { 'formatting', 'ctx', ctx }

  local res = OriginalFormattingHandler(err, result, ctx, config)

  -- if not result then return end
  -- local client = vim.lsp.get_client_by_id(ctx.client_id)

  -- -- local view = vim.fn.winsaveview()
  -- vim.lsp.util.apply_text_edits(result, ctx.bufnr, client.offset_encoding)
  -- -- vim.fn.winrestview(view)

  if ctx.bufnr == vim.api.nvim_get_current_buf() then
    vim.b.lsp_format_saving = true
    vim.cmd [[update]]
    vim.b.lsp_format_saving = false
  end

  return res
end

function _G.LspFormat()
  -- PRINT({ 'LspFormat tick', vim.b.changedtick })
  -- return vim.lsp.buf.formatting({start_changedtick = vim.b.changedtick})

  if not vim.b.lsp_format_saving then
    return vim.lsp.buf.formatting()
  else
    print 'skip format'
  end
end

function _G.LspFormatSync()
  return vim.lsp.buf.formatting_sync()
end

vim.cmd [[
command! LspFormat     call luaeval('LspFormat()')
command! LspFormatSync call luaeval('LspFormatSync()')
]]
