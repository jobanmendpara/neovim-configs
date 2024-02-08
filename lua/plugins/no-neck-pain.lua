local cmd = require('utils').cmd
local M = {
  "shortcuts/no-neck-pain.nvim",
  event = "VeryLazy",
  version = "*",
  config = function()
    require("no-neck-pain").setup({
      autocmds = {
        enableOnVimEnter = false,
        enableOnTabEnter = false,
        reloadOnColorSchemeChange = true,
      },
      width = 140,
    })
  end,
  keys = {
    { "<leader>wt", cmd('NoNeckPain'), desc = "Center Window"}
  }
}

return M
