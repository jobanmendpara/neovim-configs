local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<A-j>",
      mode = { "n", "x", "o" },
      function()
        -- default options: exact mode, multi window, all directions, with a backdrop
        local Flash = require("flash")
        local function format(opts)
          return {
            { opts.match.label1, "FlashMatch" },
            { opts.match.label2, "FlashLabel" },
          }
        end
        Flash.jump()
      end,
      desc = "Flash",
    },
    {
      "<A-S-J>",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          search = { mode = "search", max_length = 0 },
          label = { after = { 0, 0 } },
          pattern = "^"
        })
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
