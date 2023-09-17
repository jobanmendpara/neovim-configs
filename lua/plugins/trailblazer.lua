local M = {
  "LeonHeidelbach/trailblazer.nvim",
  event = "VeryLazy",
  config = function ()
    require("trailblazer").setup()
  end,
  keys = {
    { "mm", "<CMD>TrailBlazerNewTrailMark<CR>", desc = "TrailBlazer - New Mark" },
    { "mb", "<CMD>TrailBlazerTrackBack<CR>", desc = "TrailBlazer - Track Back" },
    { "mc", "<CMD>TrailBlazerDeleteAllTrailMarks<CR>", desc = "TrailBlazer - Delete All Marks" },
    { "ms", "<CMD>TrailBlazerSaveSession<CR>", desc = "TrailBlazer - Save Session" },
    { "ml", "<CMD>TrailBlazerLoadSession<CR>", desc = "TrailBlazer - Load Session" },
    { "[m", "<CMD>TrailBlazerPeekMovePreviousUp<CR>", desc = "TrailBlazer - Peek Previous" },
    { "]m", "<CMD>TrailBlazerPeekMoveNextDown<CR>", desc = "TrailBlazer - Peek Next" },
  },
}
return M
