-- lua/layers/ui/statusline/lua_line/config.lua

return {

  config = function()
    local dap_status = function()
      return require('dap').status()
    end

    local format_writing = function()
      if vim.b.format_in_progress then
        return 'W!'
      else
        return ''
      end
    end

    local format = function()
      local config = my.config.format

      if config.disabled then
        return 'D'
      end

      local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
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

}
