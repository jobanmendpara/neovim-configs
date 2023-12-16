local M = {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd([[highlight Normal ctermbg=NONE guibg=NONE]])
    vim.cmd([[colorscheme catppuccin]])
  end
}

return M
