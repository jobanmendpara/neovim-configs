local M = {
  "shortcuts/no-neck-pain.nvim",
  event = "VeryLazy",
  version = "*",
  config = function ()
    require("no-neck-pain").setup({
      autocmds = {
        --[[ enableOnVimEnter = true,
        enableOnTabEnter = true, ]]
      }
    })
  end,
}

return M
