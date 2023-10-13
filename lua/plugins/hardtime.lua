local M = {
  "m4xshen/hardtime.nvim",
  event = "VeryLazy",
  config = function ()
    require("hardtime").setup()
  end,
}

return M
