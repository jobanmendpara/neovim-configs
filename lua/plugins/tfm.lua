local M = {
  "rolv-apneseth/tfm.nvim",
  event = "VeryLazy",
  enabled=true,
  opts = {
    file_manager = "yazi",
    replace_netrw = true,
    enable_cmds = true,
    keybindings = {
      ["<ESC>"] = "q",
      ["<C-v>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR>",
      ["<C-x>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR>",
      ["<C-t>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR>",
    },
    ui = {
      border = "rounded",
      height = 1,
      width = 1,
      x = 0.5,
      y = 0.5,
    },
  },
  keys = {
    {
      "<leader>e",
      ":Tfm<CR>",
      desc = "TFM",
    },
  },
}

return M
