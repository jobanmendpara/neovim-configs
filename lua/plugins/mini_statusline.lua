local M = {
  "echasnovski/mini.statusline",
  event = "VeryLazy",
  config = function ()
    require("mini.statusline").setup({
      set_vim_settings = false,
    });
  end,
}

return M
