local cmd = require("utils").cmd
local M = {
  "folke/trouble.nvim",
  event = "BufEnter",
  config = function ()
    require("trouble").setup({
      mode = "workspace_diagnostics"
    })
  end,
  keys = {
    { "<leader>pt", cmd('TodoTelescope'), { desc = "Project Tasks & Notes"}}
  }
}

return M

