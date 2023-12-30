local cmd = require('utils').cmd

local M = {
  "LeonHeidelbach/trailblazer.nvim",
  config = true,
  keys = {
    { "gt", cmd("TrailBlazerNewTrailMark"), { desc = "New Trail Mark"} },
    { "gb", cmd("TrailBlazerTrackBack"), { desc = "Track Back"} },
  }
}

return M
