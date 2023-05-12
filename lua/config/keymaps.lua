vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" });

vim.keymap.set("n", "<leader><leader>", ":", { desc = "Remap command key" })

vim.keymap.set("n", "<esc>", "<cmd>noh<cr>", { desc = "Clear search results" })

vim.keymap.set("v", "<", "<gv", { desc = "Persist while indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "Persist while indenting" })

vim.keymap.set("v", "p", '"_dP', { desc = "Paste without replacing clipboard" })

vim.keymap.set("n", "<C-M-Up>", ":resize -10<CR>", { desc = "Vertical resize", silent= true })
vim.keymap.set("n", "<C-M-Down>", ":resize +10<CR>", { desc = "Vertical resize", silent= true })
vim.keymap.set("n", "<C-M-Left>", ":vertical resize -10<CR>", { desc = "Horizontal resize", silent= true })
vim.keymap.set("n", "<C-M-Right>", ":vertical resize +10<CR>", { desc = "Horizontal resize", silent= true })

vim.keymap.set("n", "<C-M-f>", function()
    vim.lsp.buf.format({ async = false })
    vim.api.nvim_command("write")
end, { desc = "LSP - Format Buffer" })
