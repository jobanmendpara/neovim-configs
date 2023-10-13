local M = {
  "echasnovski/mini.nvim",
  branch = "main",
  event = "BufEnter",
  config = function()
    local mini_ai = require("mini.ai").setup()
    local mini_bracketed = require("mini.bracketed").setup()
    local mini_comment = require("mini.comment").setup({
      mappings = {
        comment = 'gc',
        comment_line = 'gc',
      },
    })
    local mini_cursorword = require("mini.cursorword").setup()
    local mini_clue = require("mini.clue")
    mini_clue.setup({
      triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = '<C-w>' },
        { mode = 'n', keys = '<C-l>' },
      },
      clues = {
        mini_clue.gen_clues.windows({
          submode_move = true,
          submode_navigate = true,
          submode_resize = true,
        }),
        { mode = 'n', keys = '<leader>,',  desc = 'Preferences'},
        { mode = 'n', keys = '<leader>f',  desc = 'Find'},
        { mode = 'n', keys = '<leader>j',  desc = 'Jump'},
        { mode = 'n', keys = '<leader>l',  desc = 'LSP'},
        { mode = 'n', keys = '<leader>m',  desc = 'Move'},
        { mode = 'n', keys = '<leader>w',  desc = 'Window'},
        { mode = 'n', keys = '[b', postkeys = '[' },
        { mode = 'n', keys = ']b', postkeys = ']' },
        { mode = 'n', keys = '[d', postkeys = '[' },
        { mode = 'n', keys = ']d', postkeys = ']' },
        { mode = 'n', keys = '[<TAB>', postkeys = '[' },
        { mode = 'n', keys = ']<TAB>', postkeys = ']' },
        { mode = 'n', keys = '<C-w><C-h>', postkeys = '<C-w>' },
        { mode = 'n', keys = '<C-w><C-l>', postkeys = '<C-w>' },
        { mode = 'n', keys = '<C-w><C-j>', postkeys = '<C-w>' },
        { mode = 'n', keys = '<C-w><C-k>', postkeys = '<C-w>' },
        { mode = 'n', keys = '<Leader>mh', postkeys = '<Leader>m' },
        { mode = 'n', keys = '<Leader>mj', postkeys = '<Leader>m' },
        { mode = 'n', keys = '<Leader>mk', postkeys = '<Leader>m' },
        { mode = 'n', keys = '<Leader>ml', postkeys = '<Leader>m' },
        { mode = 'x', keys = '<Leader>mh', postkeys = '<Leader>m' },
        { mode = 'x', keys = '<Leader>mj', postkeys = '<Leader>m' },
        { mode = 'x', keys = '<Leader>mk', postkeys = '<Leader>m' },
        { mode = 'x', keys = '<Leader>ml', postkeys = '<Leader>m' },
      },
      window = {
        config = {
          width = 'auto',
          border = 'single',
        },
        delay = 100,
        scroll_down = '<C-d>',
        scroll_up = '<C-u>',
      },
    })
    local mini_files = require("mini.files").setup({
      mappings = {
        close = "<ESC>"
      }
    })
    local mini_indentscope = require("mini.indentscope").setup()
    local mini_jump = require("mini.jump").setup()
    local mini_move = require("mini.move").setup({
      mappings = {
        left       = '<Leader>mh',
        right      = '<Leader>ml',
        down       = '<Leader>mj',
        up         = '<Leader>mk',
        line_left  = '<Leader>mh',
        line_right = '<Leader>ml',
        line_down  = '<Leader>mj',
        line_up    = '<Leader>mk',
      },
    })
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
