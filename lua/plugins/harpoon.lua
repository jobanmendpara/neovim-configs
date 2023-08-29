local M = {
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    config = function ()
      require("harpoon").setup()
    end,
  }
}

return M
