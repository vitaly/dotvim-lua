-- require 'galaxyline.themes.eviline'
-- require 'galaxyline.themes.neonline'
-- require 'galaxyline.themes.spaceline'

-- LUALINE
local lsp_clients = function(msg)
  msg = msg or 'No Active Lsp'
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

local theme = {
  light = {
    normal = {
      a = { fg = '#005f00', bg = '#afdf00', gui = 'bold' },
      b = { fg = '#262626', bg = '#606060' },
      c = { fg = '#9e9e9e', bg = '#303030' },
    },
    insert = {
      a = { fg = '#005f5f', bg = '#ffffff', gui = 'bold' },
      b = { fg = '#005f5f', bg = '#87dfff' },
      c = { fg = '#87dfff', bg = '#005f87' },
    },
    visual = { a = { fg = '#870000', bg = '#ff8700', gui = 'bold' } },
    replace = { a = { fg = '#ffffff', bg = '#df0000', gui = 'bold' } },
    inactive = {
      a = { fg = '#262626', bg = '#606060', gui = 'bold' },
      b = { fg = '#262626', bg = '#606060' },
      c = { bg = '#262626', fg = '#606060' },
    },
  },
  dark = {
    normal = {
      a = { fg = '#005f00', bg = '#afdf00', gui = 'bold' },
      b = { fg = '#262626', bg = '#606060' },
      c = { fg = '#9e9e9e', bg = '#303030' },
    },
    insert = {
      a = { fg = '#005f5f', bg = '#ffffff', gui = 'bold' },
      b = { fg = '#005f5f', bg = '#87dfff' },
      c = { fg = '#87dfff', bg = '#005f87' },
    },
    visual = { a = { fg = '#870000', bg = '#ff8700', gui = 'bold' } },
    replace = { a = { fg = '#ffffff', bg = '#df0000', gui = 'bold' } },
    inactive = {
      a = { fg = '#262626', bg = '#606060', gui = 'bold' },
      b = { fg = '#262626', bg = '#606060' },
      c = { bg = '#262626', fg = '#606060' },
    },
  },
}

require('lualine').setup {

  options = {
    disabled_filetypes = { 'NvimTree', 'vista', 'dbui', 'packer' },
    -- theme = 'auto',
    -- theme = 'solarized',
    -- theme = 'Tomorrow',
    -- theme = 'PaperColor',
    -- theme = 'dracula',
    -- theme = 'powerline',
    -- theme = 'powerline_dark',
    theme = theme[vim.o.background],
  },

  sections = {
    lualine_c = { { 'filename', path = 1 }, { lsp_clients } },
  },

  inactive_sections = {
    lualine_c = { { 'filename', path = 1 } },

    lualine_x = {},
    lualine_z = { 'location' },
  },
}
