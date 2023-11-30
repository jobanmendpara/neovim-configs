local cmd = require("utils").cmd
local M = {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",
  event = "VimEnter",
  keys = {
    { "<leader>L", cmd("LcConsole"), desc = "LeetCode Console" }
  },
  opts = {
    domain = "com", ---@type lc.domain -- For now "com" is the only one supported
    arg = "leetcode.nvim", ---@type string
    lang = "javascript", ---@type lc.lang
    sql = "postgresql", ---@type lc.sql_lang
    directory = vim.fn.stdpath("data") .. "/leetcode/", ---@type string
    logging = true, ---@type boolean
    console = {
      size = {
        width = "75%", ---@type string | integer
        height = "75%", ---@type string | integer
      },
      dir = "row", ---@type "col" | "row"
    },
    description = {
      width = "40%", ---@type string | integer
    },
  },
  config = function (_, opts)
    require("leetcode").setup(opts)
  end
}

return M
