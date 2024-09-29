local M = {
  "nvim-zh/colorful-winsep.nvim",
  event = "VeryLazy",
  enabled = false,
  config = function ()
    require("colorful-winsep").setup()
  end,
}

return M
