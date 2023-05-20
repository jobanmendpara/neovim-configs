local M = {
  "folke/trouble.nvim",
  config = function ()
    require("trouble").setup({
      mode = "workspace_diagnostics"
    })
  end,
}

return M

