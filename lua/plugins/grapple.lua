local M = {
  "cbochs/grapple.nvim",
  event = "VeryLazy",
  keys = function()
    local grapple = require("grapple")
    return {
      { "[b", "<CMD>GrappleCycle backward<CR>", desc = "GrappleCycle Backward"},
      { "]b", "<CMD>GrappleCycle forward<CR>", desc = "GrappleCycle Forward"},
      { "mf", grapple.toggle, desc = "Grapple - Toggle Tag"},
    }
  end

}

return M
