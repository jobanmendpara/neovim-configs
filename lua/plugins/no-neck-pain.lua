local M = {
  "shortcuts/no-neck-pain.nvim",
  event = "VeryLazy",
  version = "*",
  config = function()
    require("no-neck-pain").setup({
      autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
      },
      mappings = {
        enabled = true,
        toggle = "<C-w>z",
      },
      width = 140,
    })
  end,
}

return M
