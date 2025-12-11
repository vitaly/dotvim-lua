--------------------------------------------------------------------------------
--- Simple watch mode: re-run last test on BufWritePost
--- This is useful for languages where neotest's LSP-based watch doesn't work
--------------------------------------------------------------------------------
local M = {}

local simple_watch_augroup = nil

function M.toggle()
  if simple_watch_augroup then
    M.stop()
  else
    M.start()
  end
end

function M.start()
  if simple_watch_augroup then return end

  simple_watch_augroup = vim.api.nvim_create_augroup('neotest_simple_watch', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = simple_watch_augroup,
    pattern = '*',
    callback = function()
      require('neotest').run.run_last()
    end,
    desc = 'Re-run last test on save',
  })

  vim.notify('Simple watch started: re-running last test on save', vim.log.levels.INFO)
end

function M.stop()
  if simple_watch_augroup then
    vim.api.nvim_del_augroup_by_id(simple_watch_augroup)
    simple_watch_augroup = nil
    vim.notify('Simple watch stopped', vim.log.levels.INFO)
  end
end

function M.is_watching()
  return simple_watch_augroup ~= nil
end

return M
