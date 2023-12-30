local M = {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  enabled = true,
  config = function()
    local null_ls = require("null-ls")
    local formatters = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      sources = {
        -- formatters.prettier,
        -- diagnostics.eslint,
      }
    })
  end,
}

return M
