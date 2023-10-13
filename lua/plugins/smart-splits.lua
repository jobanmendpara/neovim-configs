local M = {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  config = function ()
    local smart_splits = require('smart-splits')
    smart_splits.setup()
    vim.keymap.set('n', '<C-w><C-h>', smart_splits.swap_buf_left, { desc = 'Move Window Left'})
    vim.keymap.set('n', '<C-w><C-j>', smart_splits.swap_buf_down, { desc = 'Move Window Down'})
    vim.keymap.set('n', '<C-w><C-k>', smart_splits.swap_buf_up, { desc = 'Move Window Up'})
    vim.keymap.set('n', '<C-w><C-l>', smart_splits.swap_buf_right, { desc = 'Move Window Right'})
  end,
}

return M
