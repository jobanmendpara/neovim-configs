local M = {
  "NeogitOrg/neogit",
  enabled = false,
  event = "VimEnter",
  config = function ()
    require("neogit").setup()
  end
}

return M
