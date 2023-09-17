local M = {
  "sunjon/Shade.nvim",
  event = "VeryLazy",
  enabled = false,
  config = function ()
    require('shade').setup()
  end,
}

return M
