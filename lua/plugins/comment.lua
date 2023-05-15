local M = {
  "numToStr/Comment.nvim",
  lazy = true,
  keys = {
    {
      "<C-/>",
      mode = "n",
      "<Plug>(comment_toggle_linewise_current)",
    },
    {
      "<C-/>",
      mode = "x",
      "<Plug>(comment_toggle_blockwise_visual)",
    },
  },
  opts = {
    mappings = {
      basic = false,
      extra = false,
    },
  },
}

return M
