local M = {
  "echasnovski/mini.nvim",
  branch = "main",
  event = "BufEnter",
  config = function()
    local mini_ai = require("mini.ai").setup()
    local mini_bracketed = require("mini.bracketed").setup()
    local mini_comment = require("mini.comment").setup({
      mappings = {
        comment = '<C-/>',
        comment_line = '<C-/>',
      },
    })
    local mini_cursorword = require("mini.cursorword").setup()
    local mini_indentscope = require("mini.indentscope").setup()
    local mini_jump = require("mini.jump").setup()
    local mini_pairs = require("mini.pairs").setup()
    local mini_sessions = require("mini.sessions").setup()
    local mini_splitjoin = require("mini.splitjoin").setup()
    local mini_starter = require("mini.starter").setup()
    local mini_surround = require("mini.surround").setup()
    local mini_trailspace = require("mini.trailspace").setup()
    local mini_operators = require("mini.operators").setup()
  end,
}

return M
