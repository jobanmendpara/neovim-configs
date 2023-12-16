local cmd = require("utils").cmd

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command" })

vim.keymap.set("n", "<esc>", "<CMD>noh<CR>", { desc = "Clear search results" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll Up" })

vim.keymap.set("n", "d", '"_d', { desc = "Delete without replacing clipboad" })
vim.keymap.set("n", "x", '"_x', { desc = "Cut without replacing clipboad" })
vim.keymap.set("n", "c", '"_c', { desc = "Change without replacing clipboad" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without replacing clipboard" })
vim.keymap.set("v", "<C-c>", '"*y', { desc = "Copy to system clipboard" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<C-r>", "<Nop>")

vim.keymap.set("n", "<C-s>", "<CMD>up<CR>", { desc = "Save File" })
vim.keymap.set("n", "<C-S-s>", "<CMD>wa<CR>", { desc = "Save File" })

vim.keymap.set("n", "<A-t>", "<CMD>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<A-S-t>", "<CMD>tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "[<TAB>", "<CMD>tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "]<TAB>", "<CMD>tabprevious<CR>", { desc = "Previous Tab" })

vim.keymap.set("n", "<F5>", function()
  vim.lsp.buf.format({ async = true })
  vim.api.nvim_command("update")
end, { desc = "Format & Save Buffer" })

vim.keymap.set("n", "<F6>", "<CMD>Silicon<CR>", { desc = "Screenshot" })
vim.keymap.set("v", "<F6>", "<CMD>'<,'>Silicon<CR>", { desc = "Screenshot" })

vim.keymap.set("n", "g.", cmd("cd %:p:h"), { desc = "Move to this directory" })

vim.keymap.set("n", "<leader>e", function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local status = vim.fn.filereadable(buf_name)

  if status == 1 then
    vim.cmd("lua MiniFiles.open(vim.api.nvim_buf_get_name(0))")
  else
    vim.cmd("lua MiniFiles.open()")
  end
end, { desc = "File Manager" })
vim.keymap.set("n", "<leader>E", cmd("lua MiniFiles.open()"), { desc = "File Manager" })

vim.keymap.set("n", "<leader>,x", cmd("xa"), { desc = "Save All and Quit" })
vim.keymap.set("n", "<leader>,p", cmd("Lazy"), { desc = "Plugins" })

vim.keymap.set({ "n", "v" }, "<leader>c", cmd("ChatGPT"), { desc = "ChatGPT" })

vim.keymap.set("n", "<F2>", cmd('lua require("spectre").open_file_search({select_word=true})'), { desc = "Rename" })
vim.keymap.set("n", "<F8>", cmd("Lspsaga code_action"), { desc = "Code Action" })
vim.keymap.set("n", "<F9>", cmd("lua vim.diagnostic.open_float()"), { desc = "Show Line Diagnostics" })
vim.keymap.set("n", "<F11>", cmd("Lspsaga outline"), { desc = "Document Symbols" })
vim.keymap.set("n", "<F12>", cmd("Lspsaga goto_definition"), { desc = "Go To Definitions" })
vim.keymap.set("n", "<F14>", cmd("Spectre"), { desc = "Rename" })
vim.keymap.set("n", "<F21>", cmd("TroubleToggle document_diagnostics"), { desc = "Diagnostics" })
vim.keymap.set("n", "<F22>", cmd("TroubleToggle workspace_diagnostics"), { desc = "Diagnostics" })
vim.keymap.set("n", "<F24>", cmd("Lspsaga finder"), { desc = "Finder" })
vim.keymap.set("n", "<F26>", cmd('lua require("spectre").open_visual({select_word=true})'), { desc = "Rename" })
vim.keymap.set("i", "<F60>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "<leader>li", cmd("LspInfo"), { desc = "LSP Info" })
vim.keymap.set("n", "<leader>lm", cmd("Mason"), { desc = "Mason" })
vim.keymap.set("n", "<leader>lr", cmd("LspRestart"), { desc = "LSP Restart" })
vim.keymap.set("n", "<leader>ls", cmd("LspStart"), { desc = "LSP Start" })
vim.keymap.set("n", "<leader>lx", cmd("LspStop"), { desc = "LSP Stop" })
