local cmd = require("utils").cmd

local M = {
  "cseickel/diagnostic-window.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>tl",
      cmd("DiagWindowShow"),
      desc = "View Line Diagnostics",
    },
  }
}

return M
