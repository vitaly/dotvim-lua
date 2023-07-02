return {
  'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

  opts = function(opts)
    vim.tbl_extend('force', opts, {
      servers = {
        jsonls = {
          settings = {
            json = {
              schemas = require('schemastore').json.schemas(),
              validate = { enable = true },
            },
          },
        },
      },
    })
  end,
}
