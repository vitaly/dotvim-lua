-- local trace = my.log.trace
-- local debug = my.log.debug
local keys_opts = require('lazy.core.handler.keys').opts

---@param client any
---@param buf number
---@param keys string|table
---@param def KeyDef|fun()
local function map(client, buf, keys, def)
  if type(keys) ~= 'table' then
    keys = { keys }
  end
  if type(def) ~= 'table' then
    def = { def }
  end
  keys = vim.tbl_extend('keep', keys, def)
  if keys.has then
    -- if key requires capability check the client
    if not client.server_capabilities[keys.has .. 'Provider'] then
      -- if client.name ~= 'null-ls' then
      --   trace { '!provider', client.name, keys.has, keys }
      --   trace(client.server_capabilities)
      -- end
      return
    end
  end

  local opts = keys_opts(keys)
  opts.has = nil
  opts.buffer = buf

  vim.keymap.set(keys.mode or 'n', keys[1], keys[2], opts)
end
return {
  on_attach = function(client, buf)
    -- trace { 'on_attach', client.name, buf = buf, id = client.id, cap = client.server_capabilities }

    local tele = require 'plugins.telescope.maps'
    local lsp = require 'plugins.lsp.maps'

    map(client, buf, 'gd', lsp.definition)
    map(client, buf, 'gD', lsp.declaration)
    map(client, buf, 'gr', tele.lsp_references)
    map(client, buf, 'gR', lsp.references)
    map(client, buf, 'gi', tele.lsp_implementations)
    map(client, buf, 'gT', tele.lsp_type_definitions)

    map(client, buf, 'K', lsp.hover)
    map(client, buf, 'gK', lsp.signature_help)

    if vim.lsp.buf.inlay_hint then
      map('n', buf, '\\i', {
        nil,
        function()
          vim.lsp.buf.inlay_hint(0, nil)
        end,
        desc = 'Toggle Inlay Hints',
      })
    end

    require('lib.tools').add_keys { [[<localleader>r]], group = 'Refactor', { buffer = 0 } }
    map(client, buf, '<localleader>rr', lsp.rename)
    map(client, buf, '<localleader>c', lsp.code_action)

    map(client, buf, '<localleader>1', lsp.first_diagnostic)
    map(client, buf, '<localleader>n', lsp.next_diagnostic)
    map(client, buf, '<localleader>p', lsp.prev_diagnostic)

    require('lib.tools').add_keys { [[<localleader>g]], group = 'Goto', { buffer = 0 } }
    map(client, buf, '<localleader>gd', tele.lsp_definitions)
    map(client, buf, '<localleader>gD', lsp.declaration) -- conditional on has textDocument/declaration
    map(client, buf, '<localleader>gr', tele.lsp_references)
    map(client, buf, '<localleader>gR', lsp.references)
    map(client, buf, '<localleader>gi', tele.lsp_implementations)
    map(client, buf, '<localleader>gT', tele.lsp_type_definitions)
    map(client, buf, '<localleader>gci', tele.lsp_incoming_calls)
    map(client, buf, '<localleader>gco', tele.lsp_outgoing_calls)

    require('lib.tools').add_keys { [[<localleader>s]], group = 'Search', { buffer = 0 } }
    map(client, buf, '<localleader>sd', tele.lsp_document_symbols)
    map(client, buf, '<localleader>sw', tele.lsp_workspace_symbols)
    map(client, buf, '<localleader>sD', tele.lsp_dynamic_workspace_symbols)
  end,
}
