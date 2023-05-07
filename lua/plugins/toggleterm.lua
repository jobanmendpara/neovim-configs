local M = {
  "akinsho/toggleterm.nvim",
  event = "VimEnter",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      auto_scroll = true,
      direction = "float",
      float_opts = {
        border = "rounded",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
      hide_numbers = false,
      insert_mappings = true,
      open_mapping = [[<c-t>]],
      start_in_insert = true,
    })

    function _G.set_terminal_keymaps()
      local opts = { noremap = true }
      vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<c-h>", [[<C-\><C-n><C-W>h]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<c-j>", [[<C-\><C-n><C-W>j]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<c-k>", [[<C-\><C-n><C-W>k]], opts)
      vim.api.nvim_buf_set_keymap(0, "t", "<c-l>", [[<C-\><C-n><C-W>l]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}

return M
