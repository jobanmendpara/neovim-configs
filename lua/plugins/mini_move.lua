local M = {
  "echasnovski/mini.move",
  event = "VeryLazy",
  config = function ()
    require("mini.move").setup({
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
  end,
}

return M
