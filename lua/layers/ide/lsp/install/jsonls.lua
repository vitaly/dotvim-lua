return {
  setup = function(defaults)
    require('lspconfig').jsonls.setup(vim.tbl_deep_extend('force', defaults, {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    }))
  end,
}
