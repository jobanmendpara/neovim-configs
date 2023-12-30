local M = {
  "m4xshen/hardtime.nvim",
  event = "VeryLazy",
  config = function ()
    require('hardtime').setup({
      disable_mouse = false,
    })
  end,
}

return M
