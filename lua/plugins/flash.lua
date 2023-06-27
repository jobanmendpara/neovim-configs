local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  keys = {
    {
      "m",
      mode = { "n", "x", "o" },
      function()
        -- default options: exact mode, multi window, all directions, with a backdrop
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "r",
      mode = "o",
      function()
        -- jump to a remote location to execute the operator
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
  },
}

return M
