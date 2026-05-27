-- local debug = my.log.debug
local au = require('lib.au')

-- print current buffer filetype, treesitter status, and current parser.
-- also prints indent and folding information
local print_info = function()
  local filetype = vim.bo.filetype

  local filetype = vim.bo.filetype
  local ok, parser = pcall(vim.treesitter.get_parser, 0)
  local lang
  if ok and parser then
    lang = parser:lang() or 'none'
  else
    lang = 'none'
  end

  -- from vim options
  local indent_expr = vim.bo.indentexpr or vim.bo.cindent and 'cindent' or vim.bo.smartindent and 'smartindent' or 'none'
  local fold_method = vim.wo.foldmethod or 'none'
  local fold_expr = vim.wo.foldexpr or 'none'
  local fold_available = vim.treesitter.foldexpr and 'yes' or 'yes'

  vim.notify(
    string.format(
      'Filetype: %s, Parser: %s, Indent Expr: %s, Fold: %s, Expr: %s, Tsitter Fold: %s',
      filetype,
      lang,
      indent_expr,
      fold_method,
      fold_expr,
      fold_available
    ),
    vim.log.levels.INFO
  )
end

return {
  {
    'nvim-treesitter/nvim-treesitter', -- https://github.com/nvim-treesitter/nvim-treesitter

    branch = 'main',

    dependencies = {
      'mason-org/mason.nvim',
      'RRethy/nvim-treesitter-endwise', -- https://github.com/RRethy/nvim-treesitter-endwise
    },

    build = ':TSUpdate',

    lazy = false,

    cmd = { 'TSInstall', 'TSInstalFromGrammar', 'TSUpdate', 'TSUninstall', 'TSLog' },

    keys = {
      { '<leader>aTu', '<cmd>TSUpdate<cr>', desc = 'Update' },
      { '<leader>aTh', '<cmd>checkhealth vim.treesitter<cr>', desc = 'vim.treesitter health' },
      { '<leader>aTH', '<cmd>checkhealth nvim-treesitter<cr>', desc = 'nvim-treesitter health' },
      { '<leader>aTi', print_info, desc = 'Info' },
      {
        '<leader>aTt',
        function()
          local buf = vim.api.nvim_get_current_buf()
          if vim.treesitter.highlighter.active[buf] then
            vim.treesitter.stop(buf)
            vim.notify('Treesitter: off', vim.log.levels.INFO)
          else
            local ok, err = pcall(vim.treesitter.start, buf)
            if ok then
              vim.notify('Treesitter: on', vim.log.levels.INFO)
            else
              vim.notify('Treesitter start failed: ' .. tostring(err), vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Toggle',
      },
    },

    init = function()
      local config = require('onion.config')
      config.set_defaults('treesitter', {
        ignore_filetypes = {},
      })

      require('which-key').add({
        { [[<leader>aT]], group = 'Tree Sitter' },
      })
    end,

    config = function()
      require('nvim-treesitter').install({
        'bash',
        'c',
        'comment',
        'cpp',
        'css',
        'elixir',
        'go',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'latex',
        'lua',
        'make',
        'markdown_inline',
        'markdown',
        'python',
        'query',
        'regex',
        'ruby',
        'rust',
        'scala',
        'scss',
        'toml',
        'typescript',
        'vim',
        'yaml',
      })

      local config = require('onion.config')
      local ignore = {}
      for _, ft in ipairs(config.get('treesitter.ignore_filetypes') or {}) do
        ignore[ft] = true
      end

      -- setup treesitter indent unless filetype is in the ignore_fioletypes query
      au.command('onion.treesitter.indent', 'FileType', function(args)
        if ignore[vim.bo[args.buf].filetype] then return end

        local ok, parser = pcall(vim.treesitter.get_parser, args.buf)
        if not ok or not parser then return end
        local lang = parser:lang()

        if not vim.treesitter.query.get(lang, 'indents') then return end

        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end)
    end,
  },
}
