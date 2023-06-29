local UTILS = {}

function UTILS.filetype()
  return vim.api.nvim_get_option_value('filetype', { buf = 0 })
end

-- buffer can have several lsp clients attached.
-- we want to know the one that actually handle's the buffer's filetype
-- TODO: rank matches by number of filetypes supported and return the one with the smallest count
function UTILS.lsp_client()
  local buf_ft = UTILS.filetype()
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return ''
  end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return ''
end

return UTILS
