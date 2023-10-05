vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" });
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" }); -- Needed so spectre can detect escape

vim.keymap.set("n", "<leader><leader>", ":", { desc = "Remap command key" })

vim.keymap.set("n", "<esc>", "<CMD>noh<CR>", { desc = "Clear search results" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })

vim.keymap.set("v", "<", "<gv", { desc = "Persist while indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "Persist while indenting" })

vim.keymap.set("n", "d", '"_d', { desc = "Delete without replacing clipboad" })
vim.keymap.set("n", "x", '"_x', { desc = "Cut without replacing clipboad" })
vim.keymap.set("n", "c", '"_c', { desc = "Change without replacing clipboad" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without replacing clipboard" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<C-r>", "<Nop>")

vim.keymap.set("n", "<C-M-Up>", ":resize -8<CR>", { desc = "Vertical resize", silent= true })
vim.keymap.set("n", "<C-M-Down>", ":resize +8<CR>", { desc = "Vertical resize", silent= true })
vim.keymap.set("n", "<C-M-Left>", ":vertical resize -8<CR>", { desc = "Horizontal resize", silent= true })
vim.keymap.set("n", "<C-M-Right>", ":vertical resize +8<CR>", { desc = "Horizontal resize", silent= true })

vim.keymap.set("n", "<C-s>", "<CMD>up<CR>", { desc = "Save File"});
vim.keymap.set("n", "<C-S-s>", "<CMD>wa<CR>", { desc = "Save File"});

vim.keymap.set("n", "<A-f>", "<CMD>Telescope find_files<CR>", { desc = "Find File"});
vim.keymap.set("n", "<A-b>", "<CMD>GrapplePopup tags<CR>", { desc = "Grapple"});
vim.keymap.set("n", "[<TAB>", "<CMD>tabnext<CR>", { desc = "Next Tab"});
vim.keymap.set("n", "]<TAB>", "<CMD>tabprevious<CR>", { desc = "Previous Tab"});
