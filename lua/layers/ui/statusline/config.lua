local m = {}

-- require 'galaxyline.themes.eviline'
-- require 'galaxyline.themes.neonline'
-- require 'galaxyline.themes.spaceline'

-- LUALINE: https://github.com/nvim-lualine/lualine.nvim
local lsp_clients = function()
  local msg = ''
  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

local dap_status = function()
  return require('dap').status()
end

local format_writing = function()
  if vim.g.format_writing then
    return 'W!'
  else
    return ''
  end
end

local autoformat = function()
  if vim.b.autoformat and vim.b.autoformat ~= 0 then
    local lsp = vim.b.format_with_lsp or 1 -- default is 1
    if lsp and lsp ~= 0 then
      return vim.g.format_debug and 'LD' or 'L'
    else
      return vim.g.format_debug and 'FD' or 'F'
    end
  else
    return ''
  end
end

-- local lsp_status = function()
--   if #vim.lsp.buf_get_clients() > 0 then
--     return require('lsp-status').status()
--   end
--   return ''
-- end

local theme = {
  light = {
    normal = {
      a = { fg = '#005f00', bg = '#afdf00', gui = 'bold' },
      -- b = { fg = '#262626', bg = '#606060' },
      b = { fg = '#005f5f', bg = '#97efff' },
      -- c = { fg = '#9e9e9e', bg = '#303030' },
      c = { fg = '#ffffff', bg = '#005f87' },
    },
    -- insert = {
    --   a = { fg = '#005f5f', bg = '#ffffff', gui = 'bold' },
    --   b = { fg = '#005f5f', bg = '#87dfff' },
    --   -- c = { fg = '#87dfff', bg = '#005f87' },
    --   c = { fg = '#ffffff', bg = '#005f87' },
    -- },
    insert = { a = { fg = '#005f5f', bg = '#87dfff', gui = 'bold' } },
    visual = { a = { fg = '#870000', bg = '#ff8700', gui = 'bold' } },
    replace = { a = { fg = '#ffffff', bg = '#df0000', gui = 'bold' } },

    inactive = {
      a = { fg = '#262626', bg = '#606060', gui = 'bold' },
      b = { fg = '#262626', bg = '#606060' },
      c = { bg = '#262626', fg = '#a0a0a0' },
    },
  },
}

function m.setup()
  require('lualine').setup {

    options = {
      disabled_filetypes = { 'dbui', 'packer' },
      theme = theme.light,
    },

    tabline = {
      lualine_a = { { 'tabs', mode = 1 } },
    },

    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', { 'diagnostics', sources = { 'nvim_diagnostic' } } },
      lualine_c = {
        { 'filename', path = 1 },
        { autoformat },
        { format_writing, color = { fg = 'red' } },
        { dap_status, color = { bg = '#ff0000' } },
      },
      lualine_x = { 'encoding', 'fileformat', 'filetype', { lsp_clients } },
      -- lualine_y = {'progress'},
      lualine_y = { '%02B' },
      lualine_z = { 'progress', 'location' },
    },

    inactive_sections = {
      lualine_c = { { 'filename', path = 1 } },

      lualine_x = {},
      lualine_z = { 'location' },
    },

    extensions = {
      'fugitive',
      'nvim-tree',
      'quickfix',
      'symbols-outline',
    },
  }
end

return m
