-- Create a namespace. This won't be used to add any diagnostics,
-- only to display them.
local ns = vim.api.nvim_create_namespace 'filtered_diagnostics'

if not vim.g.orig_show then
  vim.fn.orig_show = vim.diagnostic.show
  vim.g.orig_show = true
end

local function set_signs(bufnr)
  -- Get all diagnostics from the current buffer
  local diagnostics = vim.diagnostic.get(bufnr)

  -- Find the "worst" diagnostic per line
  local max_severity_per_line = {}
  for _, d in pairs(diagnostics) do
    local m = max_severity_per_line[d.lnum]
    if not m or d.severity < m.severity then
      max_severity_per_line[d.lnum] = d
    end
  end

  -- Show the filtered diagnostics using the custom namespace. Use the
  -- reference to the original function to avoid a loop.
  local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
  vim.fn.orig_show(ns, bufnr, filtered_diagnostics, {
    virtual_text = false,
    underline = false,
    signs = true,
    severity_sort = true,
  })
end

function vim.diagnostic.show(namespace, bufnr, ...)
  vim.fn.orig_show(namespace, bufnr, ...)
  if bufnr then
    set_signs(bufnr)
  end
end

local config = {
  virtual_text = false,
  -- virtual_text = { prefix = '', spacing = 5 },
  signs = false, -- disable original signs handler, we are going to add signs ourselves
  underline = true,
  update_in_insert = false,
}

-- we can override diagnostics settings per invocation
-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, config)

-- or globally
vim.diagnostic.config(config)
