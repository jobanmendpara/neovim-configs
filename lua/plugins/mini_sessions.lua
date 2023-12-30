local M = {
  "echasnovski/mini.sessions",
  event = "VeryLazy",
  config = function ()
    require("mini.sessions").setup({
      autoread = false,
      autowrite = true,
    })
  end,
}

return M
