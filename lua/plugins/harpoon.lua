local M = {
    "ThePrimeagen/harpoon",
    event = "BufReadPost",
    config = function()
        require("harpoon").setup()
    end,
}

return M
