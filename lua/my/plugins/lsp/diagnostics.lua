-- Capture real implementation of function that sets signs
if not vim.g.orig_set_signs then
  vim.g.orig_set_signs = vim.lsp.diagnostic.set_signs
end
return function(diagnostics, bufnr, client_id, sign_ns, opts)
  PRINT { diagnostics = diagnostics, bufnr = bufnr, client_id = client_id, sign_ns = sign_ns, opts = opts }
  -- original func runs some checks, which I think is worth doing
  -- but maybe overkill
  -- if not diagnostics then
  --   diagnostics = diagnostic_cache[bufnr][client_id]
  -- end

  -- early escape
  if not diagnostics then
    return
  end

  -- Work out max severity diagnostic per line
  local max_severity_per_line = {}
  for _, d in pairs(diagnostics) do
    if max_severity_per_line[d.range.start.line] then
      local current_d = max_severity_per_line[d.range.start.line]
      if d.severity < current_d.severity then
        max_severity_per_line[d.range.start.line] = d
      end
    else
      max_severity_per_line[d.range.start.line] = d
    end
  end

  -- map to list
  local filtered_diagnostics = {}
  for i, v in pairs(max_severity_per_line) do
    table.insert(filtered_diagnostics, v)
  end

  -- call original function
  vim.g.orig_set_signs(filtered_diagnostics, bufnr, client_id, sign_ns, opts)
end
