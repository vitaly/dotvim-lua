return function (use)
  use({
    "NTBBloodbath/galaxyline.nvim",
    -- your statusline
    config = function()
      -- require("galaxyline.themes.eviline")
      -- require("galaxyline.themes.neonline")
      require("galaxyline.themes.spaceline")
    end,
    -- some optional icons
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  })
end
