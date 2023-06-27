local M = {
  "echasnovski/mini.nvim",
  version = "false",
  event = "BufEnter",
  config = function()
    local mini_ai = require("mini.ai").setup()
    local mini_bracketed = require("mini.bracketed").setup()
    local mini_comment = require("mini.comment").setup()
    local mini_cursorword = require("mini.cursorword").setup()
    local mini_indentscope = require("mini.indentscope").setup()
    local mini_pairs = require("mini.pairs").setup()
    local mini_sessions = require("mini.sessions").setup()
    local mini_splitjoin = require("mini.splitjoin").setup()
    local mini_starter = require("mini.starter").setup()
    local mini_surround = require("mini.surround").setup()
    local mini_trailspace = require("mini.trailspace").setup()
  end,
}

return M
