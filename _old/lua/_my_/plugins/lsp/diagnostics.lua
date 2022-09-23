-- Create a namespace. This won't be used to add any diagnostics,
-- only to display them.
local ns = vim.api.nvim_create_namespace 'filtered_diagnostics'

if not _G.OriginalDiagnosticShow then
  -- print 'saving diagnostics show'
  _G.OriginalDiagnosticShow = vim.diagnostic.show
  -- else
  -- print 'already set diagnostics show'
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
  OriginalDiagnosticShow(ns, bufnr, filtered_diagnostics, {
    virtual_text = false,
    underline = false,
    signs = true,
    severity_sort = true,
  })
end

function vim.diagnostic.show(namespace, bufnr, ...)
  OriginalDiagnosticShow(namespace, bufnr, ...)
  if bufnr then
    set_signs(bufnr)
  end
end

local config = {
  signs = false, -- disable original signs handler, we are going to add signs ourselves
}
