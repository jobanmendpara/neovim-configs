local cmd = require('utils').cmd
local M = {
  "shortcuts/no-neck-pain.nvim",
  event = "VeryLazy",
  version = "*",
  config = function()
    require("no-neck-pain").setup({
      autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
      },
      width = 120,
    })
  end,
  keys = {
    { "<M-c>", cmd('NoNeckPain'), desc = "Center Window"}
  }
}

return M
