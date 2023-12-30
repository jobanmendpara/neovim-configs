local cmd = require("utils").cmd

local M = {
  "sourcegraph/sg.nvim",
  event = "VeryLazy",
  build = "nvim -l build/init.lua",
  config = function ()
    require("sg").setup({})
  end,
  keys = {
    {"<leader>c", cmd("CodyChat"), { desc = "Cody Chat"}}
  }
}

return M
