local M = {
  "echasnovski/mini.surround",
  version = "*",
  event = "VeryLazy",
  config = function ()
    local mini_surround = require("mini.surround").setup({
      custom_surroundings = nil,
      highlight_duration = 500,
      mappings = {
        add = '<leader>sa',            -- Add surrounding in Normal and Visual modes
        delete = '<leader>sd',         -- Delete surrounding
        find = '<leader>sf',           -- Find surrounding (to the right)
        find_left = '<leader>sF',      -- Find surrounding (to the left)
        highlight = '<leader>sh',      -- Highlight surrounding
        replace = '<leader>sr',        -- Replace surrounding
        update_n_lines = '<leader>sn', -- Update `n_lines`
        suffix_last = 'l',     -- Suffix to search with "prev" method
        suffix_next = 'n',     -- Suffix to search with "next" method
      },
      n_lines = 20,
      search_method = 'cover',
      silent = false,
    })
  end
}

return M
