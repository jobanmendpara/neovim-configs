local M = {
  "NeogitOrg/neogit",
  event = "VimEnter",
  config = function ()
    require("neogit").setup()
  end
}

return M
