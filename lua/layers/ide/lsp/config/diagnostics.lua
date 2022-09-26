-- this is copied from an example in the manual
-- Create a custom namespace. This will aggregate signs from all other
-- namespaces and only show the one with the highest severity on a
-- given line

-- TODO: not sure why do we need to create separate namespace
local ns = vim.api.nvim_create_namespace 'my_diagnostics'

-- Get a reference to the original signs handler
_my.config.diagnostics = _my.config.diagnostics or {}
_my.config.diagnostics.orig_signs_handler = _my.config.diagnostics.orig_signs_handler or vim.diagnostic.handlers.signs
local handler = _my.config.diagnostics.orig_signs_handler

-- Override the built-in signs handler
vim.diagnostic.handlers.signs = {
  show = function(_, bufnr, _, opts)
    -- Get all diagnostics from the whole buffer rather than just the
    -- diagnostics passed to the handler
    local diagnostics = vim.diagnostic.get(bufnr)

    -- Find the "worst" diagnostic per line
    local max_severity_per_line = {}
    for _, d in pairs(diagnostics) do
      local m = max_severity_per_line[d.lnum]
      if not m or d.severity < m.severity then
        max_severity_per_line[d.lnum] = d
      end
    end

    -- Pass the filtered diagnostics (with our custom namespace) to
    -- the original handler
    local filtered_diagnostics = vim.tbl_values(max_severity_per_line)
    handler.show(ns, bufnr, filtered_diagnostics, opts)
  end,
  hide = function(_, bufnr)
    handler.hide(ns, bufnr)
  end,
}
