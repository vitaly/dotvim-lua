return {
  load = function ()

    local use = require('packer').use

    use { 'wbthomason/packer.nvim', opt = true }
    use 'lewis6991/impatient.nvim' -- https://github.com/lewis6991/impatient.nvim
    use 'nvim-lua/plenary.nvim' -- https://github.com/nvim-lua/plenary.nvim
    use 'folke/which-key.nvim' -- https://github.com/folke/which-key.nvim
}
