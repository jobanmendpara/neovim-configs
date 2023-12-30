local M = {
  "echasnovski/mini.clue",
  event = "VeryLazy",
  config = function()
    local mini_clue = require("mini.clue")
    mini_clue.setup({
      triggers = {
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
        { mode = 'n', keys = ']' },
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = '<C-w>' },
        { mode = 'n', keys = '<C-l>' },
        { mode = 'n', keys = '"' },
        { mode = 'i', keys = '<C-x>' }
      },
      clues = {
        mini_clue.gen_clues.builtin_completion(),
        mini_clue.gen_clues.windows({
          submode_move = true,
          submode_navigate = true,
          submode_resize = true,
        }),
        mini_clue.gen_clues.g(),
        mini_clue.gen_clues.z(),
        mini_clue.gen_clues.registers({
          show_contents = true,
        }),
        { mode = 'n', keys = '<leader>,',  desc = 'Preferences' },
        -- { mode = 'n', keys = '<leader>f',  desc = 'Find' },
        { mode = 'n', keys = '<leader>j',  desc = 'Jump' },
        { mode = 'n', keys = '<leader>l',  desc = 'LSP' },
        { mode = 'n', keys = '<leader>m',  desc = 'Move' },
        { mode = 'n', keys = '<leader>w',  desc = 'Window' },
        { mode = 'n', keys = '<leader>t',  desc = 'Telescope' },
        { mode = 'n', keys = '[p',         postkeys = '[' },
        { mode = 'n', keys = ']p',         postkeys = ']' },
        { mode = 'n', keys = '[d',         postkeys = '[' },
        { mode = 'n', keys = ']d',         postkeys = ']' },
        { mode = 'n', keys = '[v',         postkeys = '[' },
        { mode = 'n', keys = ']v',         postkeys = ']' },
        { mode = 'n', keys = '[<TAB>',     postkeys = '[' },
        { mode = 'n', keys = ']<TAB>',     postkeys = ']' },
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
  end,
}

return M
