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
      "<leader>ml",
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
      "<leader>mw",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump({
          pattern = ".", -- initialize pattern with any char
          search = {
            mode = function(pattern)
              -- remove leading dot
              if pattern:sub(1, 1) == "." then
                pattern = pattern:sub(2)
              end
              -- return word pattern and proper skip pattern
              return ([[\v<%s\w*>]]):format(pattern), ([[\v<%s]]):format(pattern)
            end,
          },
          -- select the range
          jump = { pos = "range" },
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
