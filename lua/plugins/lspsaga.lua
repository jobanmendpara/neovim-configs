local M = {
  'nvimdev/lspsaga.nvim',
  event = "VeryLazy",
  config = function()
    local codicons = require('codicons')
    require('lspsaga').setup({
      lightbulb = {
        enable = true,
        virtual_text = false,
      },
      ui = {
        code_action = codicons.get('lightbulb'),
      },
      beacon = {
        enable = false
      }
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons',     -- optional
  }
}

return M
