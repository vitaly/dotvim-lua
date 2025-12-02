-- local trace = my.log.trace
-- local debug = my.log.debug
local tools = require('lib.tools')
local which_key = require('which-key')

---@param client any
---@param buf number
---@param keys string|table
---@param def KeyDef|fun()
local function lsp_map(client, buf, lhs, def)
  if type(def) ~= 'table' then
    def = { rhs = def }
  end
  if def.has then
    -- if key requires capability check the client
    if not client.server_capabilities[def.has .. 'Provider'] then
      -- if client.name ~= 'null-ls' then
      --   trace { '!provider', client.name, keys.has, keys }
      --   trace(client.server_capabilities)
      -- end
      return
    end
  end

  vim.keymap.set(def.mode or 'n', lhs, def.rhs, {
    buffer = buf,
    desc = def.desc,
    -- noremap is true by default, unless explicitly set to false or remap is true
    noremap = def.noremap ~= false and (def.remap ~= true),
    remap = def.remap,
    expr = def.expr,
    silent = def.silent,
  })
end

return {
  on_attach = function(client, buf)
    -- trace { 'on_attach', client.name, buf = buf, id = client.id, cap = client.server_capabilities }

    local tele = require('plugins.telescope.maps')
    local lsp = require('plugins.lsp.maps')

    lsp_map(client, buf, 'gd', lsp.definition)
    lsp_map(client, buf, 'gD', lsp.declaration)
    lsp_map(client, buf, 'gr', tele.lsp_references)
    lsp_map(client, buf, 'gR', lsp.references)
    lsp_map(client, buf, 'gi', tele.lsp_implementations)
    lsp_map(client, buf, 'gT', tele.lsp_type_definitions)

    lsp_map(client, buf, 'K', lsp.hover)
    lsp_map(client, buf, 'gK', lsp.signature_help)

    if vim.lsp.buf.inlay_hint then
      lsp_map('n', buf, '\\i', {
        nil,
        function()
          vim.lsp.buf.inlay_hint(0, nil)
        end,
        desc = 'Toggle Inlay Hints',
      })
    end

    which_key.add_keys({ [[<localleader>r]], group = 'Refactor', { buffer = 0 } })
    lsp_map(client, buf, '<localleader>rr', lsp.rename)
    lsp_map(client, buf, '<localleader>c', lsp.code_action)

    lsp_map(client, buf, '<localleader>1', lsp.first_diagnostic)
    lsp_map(client, buf, '<localleader>n', lsp.next_diagnostic)
    lsp_map(client, buf, '<localleader>p', lsp.prev_diagnostic)

    which_key.add_keys({ [[<localleader>g]], group = 'Goto', { buffer = 0 } })
    lsp_map(client, buf, '<localleader>gd', tele.lsp_definitions)
    lsp_map(client, buf, '<localleader>gD', lsp.declaration) -- conditional on has textDocument/declaration
    lsp_map(client, buf, '<localleader>gr', tele.lsp_references)
    lsp_map(client, buf, '<localleader>gR', lsp.references)
    lsp_map(client, buf, '<localleader>gi', tele.lsp_implementations)
    lsp_map(client, buf, '<localleader>gT', tele.lsp_type_definitions)
    lsp_map(client, buf, '<localleader>gci', tele.lsp_incoming_calls)
    lsp_map(client, buf, '<localleader>gco', tele.lsp_outgoing_calls)

    which_key.add_keys({ [[<localleader>s]], group = 'Search', { buffer = 0 } })
    lsp_map(client, buf, '<localleader>sd', tele.lsp_document_symbols)
    lsp_map(client, buf, '<localleader>sw', tele.lsp_workspace_symbols)
    lsp_map(client, buf, '<localleader>sD', tele.lsp_dynamic_workspace_symbols)
  end,
}
