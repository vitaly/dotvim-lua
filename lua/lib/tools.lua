-- clone repository into given directory if it doesn't exist
local tools = {}

---@param repo string
---@param path string
function tools.ensure_cloned(repo, path, ...)
  if vim.uv.fs_stat(path) then
    return
  end

  my.log.info('git clone ' .. repo .. ' into ' .. path)

  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    ...,
    repo,
    path,
  }
end

return tools
