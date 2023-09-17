local M = {
  "numToStr/Navigator.nvim",
  event = "VeryLazy",
  keys = {
    { "<C-Left>", "<cmd>NavigatorLeft<cr>" },
    { "<C-Right>", "<cmd>NavigatorRight<cr>" },
    { "<C-Up>", "<cmd>NavigatorUp<cr>" },
    { "<C-Down>", "<cmd>NavigatorDown<cr>" },
  },
  config = true,
}

return M

