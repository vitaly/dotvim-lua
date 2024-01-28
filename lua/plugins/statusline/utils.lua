local UTILS = {}

local function get_clients()
  ---@diagnostic disable-next-line: deprecated
  return vim.lsp.get_clients() or vim.lsp.get_active_clients()
end

---@param bufnr? number
function UTILS.filetype(bufnr)
  if not bufnr then
    bufnr = vim.api.nvim_get_current_buf()
  end
  return vim.api.nvim_get_option_value('filetype', { buf = 0 })
end

-- buffer can have several lsp clients attached.
-- we want to know the one that actually handle's the buffer's filetype
-- TODO: rank matches by number of filetypes supported and return the one with the smallest count
---@param bufnr? number
function UTILS.lsp_client_name(bufnr)
  if not bufnr then
    bufnr = vim.api.nvim_get_current_buf()
  end
  local buf_ft = UTILS.filetype(bufnr)
  local clients = get_clients()
  if next(clients) == nil then
    return ''
  end

  for _, client in ipairs(clients) do
    ---@diagnostic disable-next-line: undefined-field
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return ''
end

return UTILS
