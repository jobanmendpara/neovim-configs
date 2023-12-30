local cmd = require('utils').cmd

local M = {
  "echasnovski/mini.visits",
  event = "VeryLazy",
  config = function()
    require("mini.visits").setup({
      track = {
        event = '',
      }
    })
  end,
  keys = function()
    local mini_visits = require("mini.visits")

    local function toggleFileMark()
      local winId = vim.api.nvim_get_current_win()
      local bufId = vim.api.nvim_win_get_buf(winId)
      local currentBufferPath = vim.api.nvim_buf_get_name(bufId)

      local list = mini_visits.list_paths()
      local existsInList = false

      for _, path in ipairs(list) do
        if currentBufferPath == path then
          existsInList = true
          break
        end
      end

      if existsInList then
        vim.notify("Unmark File")
        mini_visits.remove_path()
      else
        vim.notify("Mark File")
        return mini_visits.register_visit()
      end
    end

    return {
      { ">",              function() toggleFileMark() end,                 desc = "Mark File" },
      { "<leader>>",      cmd("lua MiniVisits.add_label()"),               desc = "Add Label" },
      { "<leader><",      cmd("lua MiniVisits.remove_label()"),            desc = "Remove Label" },
      { "[v",             cmd("lua MiniVisits.iterate_paths('backward')"), desc = "Cycle Paths Backward" },
      { "]v",             cmd("lua MiniVisits.iterate_paths('forward')"),  desc = "Cycle Paths Forward" },
      { "<leader><M-BS>", cmd("lua MiniVisits.select_label()"),            desc = "View Labels" },
    }
  end,
}

return M
