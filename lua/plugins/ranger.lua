local M = {
  "kelly-lin/ranger.nvim",
  event = "VeryLazy",
  enabled = false,
  config = function()
    local ranger = require("ranger-nvim")
    ranger.setup({
      enable_cmds = false,
      replace_netrw = false,
      keybinds = {
        ["ov"] = ranger.OPEN_MODE.vsplit,
        ["oh"] = ranger.OPEN_MODE.split,
        ["ot"] = ranger.OPEN_MODE.tabedit,
        ["or"] = ranger.OPEN_MODE.rifle,
      },
      ui = {
        border = "single",
        height = 1,
        width = 1,
        x = 0.5,
        y = 0.5,
      }
    })
  end,
  keys = {
    { "<leader>e", function() require("ranger-nvim").open(true) end, desc = "File Explorer" },
  }
}

return M
