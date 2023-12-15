local M = {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  enabled = false,
  config = function ()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier,
      }
    })
  end,
}

return M
