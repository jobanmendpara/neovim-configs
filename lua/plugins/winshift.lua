local cmd = require("utils").cmd
local M = {
  "sindrets/winshift.nvim",
  event = "VeryLazy",
  config = true,
  keys = {
    { "<C-w>h", cmd("WinShift left"), desc = "Move Window Left"},
    { "<C-w>j", cmd("WinShift down"), desc = "Move Window Down"},
    { "<C-w>k", cmd("WinShift up"), desc = "Move Window Up"},
    { "<C-w>l", cmd("WinShift right"), desc = "Move Window Right"},
  }
}

return M
