---@param command string
---@return string
local function cmd(command)
  return '<cmd>' .. command .. '<cr>'
end
--- @type MapDef[]
local maps = {
  lsp_info = { cmd 'LspInfo', desc = 'Lsp Info' },
  lsp_log = { cmd 'LspLog', desc = 'Lsp Log' },
  lsp_start = { cmd 'LspStart', desc = 'Lsp Stop' },
  lsp_stop = { cmd 'LspStop', desc = 'Lsp Stop' },
  lsp_restart = { cmd 'LspRestart', desc = 'Lsp Restart' },
}

return maps
