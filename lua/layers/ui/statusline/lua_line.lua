-- lua/layers/ui/statusline/lua_line/config.lua

return {

  'nvim-lualine/lualine.nvim', -- https://github.com/nvim-lualine/lualine.nvim
  requires = { 'kyazdani42/nvim-web-devicons' },

  config = function()
    -- cycle through buffer's lsp clients
    -- return the one which actually sypports the buffer's filetype
    -- return '' otherwise
    local lsp_client = function()
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return ''
      end

      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return ''
    end

    local dap_status = function()
      return require('dap').status()
    end

    local packer_refresh = function()
      if vim.g.packer_refresh_in_progress then
        return '!RELOADING!'
      else
        return ''
      end
    end

    local format_writing = function()
      if vim.b.format_in_progress then
        return 'W!'
      else
        return ''
      end
    end

    local format = function()
      local config = _my.config.format

      if config.disabled then
        return 'D'
      end

      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      if config.disabled_filetypes[buf_ft] then
        return 'd'
      end

      return 'A'
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
          -- { 'filename', path = 1 },
          { format },
          { packer_refresh, color = { fg = 'red', bg = 'yellow' } },
          { format_writing, color = { fg = 'red' } },
          { dap_status, color = { bg = '#ff0000' } },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype', { lsp_client } },
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
  end,
}
