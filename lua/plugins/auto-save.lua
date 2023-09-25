local M = {
  "Pocco81/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = "BufEnter",
  config = function ()
    require("auto-save").setup()
  end,
}

return M
