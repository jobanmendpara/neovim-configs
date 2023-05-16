local M = {
  "cbochs/grapple.nvim",
  event = "VeryLazy",
  config = function ()
    require("grapple").setup()
  end
}

return M
