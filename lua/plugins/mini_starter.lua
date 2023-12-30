local M = {
  "echasnovski/mini.starter",
  event = "BufEnter",
  dependencies = {
    "echasnovski/mini.sessions",
  },
  config = function ()
    local mini_starter = require("mini.starter")
    mini_starter.setup({
      content_hooks = {
        mini_starter.gen_hook.adding_bullet(""),
        mini_starter.gen_hook.aligning("center", "center"),
      },
      evaluate_single = true,
      header = os.date(),
      query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
      items = {
        mini_starter.sections.sessions(5, true),
        { action = "Telescope find_files", name = "f: Find Files",  section = "Actions" },
        { action = "enew",                 name = "e: New Buffer",  section = "Actions" },
        { action = "qa!",                  name = "q: Quit Neovim", section = "Actions" },
        {
          action = function()
            vim.cmd("e ~/.dotfiles/nvim/.config/nvim/init.lua")
            vim.cmd("cd %:p:h")
          end,
          name = "c: Neovim",
          section = "Configs"
        },
        {
          action = function()
            vim.cmd("e ~/.dotfiles/wezterm/.wezterm.lua")
            vim.cmd("cd %:p:h")
          end,
          name = "w: Wezterm",
          section = "Configs"
        },
        {
          action = function()
            vim.cmd("e ~/.dotfiles/")
            vim.cmd("cd %:p:h")
          end,
          name = ".: Dotfiles",
          section = "Configs"
        },
      }
    })
  end,
}

return M
