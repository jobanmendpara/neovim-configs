local cmd = require('utils').cmd

local M = {
  'nvimdev/lspsaga.nvim',
  event = "VeryLazy",
  config = function()
    local codicons = require('codicons')
    require('lspsaga').setup({
      code_action = {
        keys = {
          quit = "<esc>",
          exec = "<cr>",
        },
      },
      diagnostic = {
        keys = {
          quit = { 'q', '<ESC>' },
          exec = "<cr>",
        },
      },
      finder = {
        layout = 'normal',
      },
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
  },
  keys = {
    { ']d', cmd('Lspsaga diagnostic_jump_next'), desc = 'Next Diagnostic'},
    { '[d', cmd('Lspsaga diagnostic_jump_prev'), desc = 'Prev Diagnostic'},
    { 'K', cmd('Lspsaga peek_definition'), desc = 'Peek'},
    { 'H', cmd('Lspsaga hover_doc'), desc = 'Hover'},
  },
}

return M
