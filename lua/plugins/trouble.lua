local M = {
  "folke/trouble.nvim",
  event = "BufEnter",
  config = function ()
    require("trouble").setup({
      mode = "workspace_diagnostics"
    })
  end,
}

return M

