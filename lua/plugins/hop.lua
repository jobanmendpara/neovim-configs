local M = {
  "phaazon/hop.nvim",
  event = "VeryLazy",
  config = function()
    local hop = require("hop")
    hop.setup({
      jump_on_sole_occurence = true,
      uppercase_labels = false,
    })

    vim.keymap.set("n", "m", "<CMD>HopChar1<CR>", { desc = "Hop - 1 Char" })
    vim.keymap.set("v", "m", "<CMD>HopChar1<CR>", { desc = "Hop - 1 Char" })
    vim.keymap.set("n", "<leader>ml", "<CMD>HopLine<CR>", { desc = "Hop - Line" })
    vim.keymap.set("v", "<leader>ml", "<CMD>HopLine<CR>", { desc = "Hop - Line" })
    vim.keymap.set("n", "<leader>mw", "<CMD>HopWord<CR>", { desc = "Hop - Word" })
    vim.keymap.set("v", "<leader>mw", "<CMD>HopWord<CR>", { desc = "Hop - Word" })
  end,
}

return M
