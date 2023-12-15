local M = {
  "shortcuts/no-neck-pain.nvim",
  event = "VeryLazy",
  version = "*",
  config = function()
    require("no-neck-pain").setup({
      autocmds = {
        enableOnVimEnter = true,
        enableOnTabEnter = true,
        reloadOnColorSchemeChange = true,
      },
      mappings = {
        enabled = true,
        toggle = "<leader>wt",
        toggleLeftSide = "<leader>wl",
        toggleRightSide = "<leader>wr",
        widthUp = "<leader>w+",
        widthDown = "<leader>w-",
        scratchPad = "<leader>ws",
      },
      width = 140,
    })
  end,
}

return M
