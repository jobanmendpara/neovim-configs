local M = {
  "utilyre/barbecue.nvim",
  dependencies = {
    "SmiteshP/nvim-navic",
  },
  event = "VeryLazy",
  config = function ()
    require("barbecue").setup()
  end
}

return M
