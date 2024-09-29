local cmd = require("utils").cmd

vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command" })

vim.keymap.set("n", "<esc>", "<CMD>noh<CR>", { desc = "Clear search results" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Focus Left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Focus Down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Focus Up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Focus Right" })
vim.keymap.set("n", "<C-q>", "<C-w>c", { desc = "Close Window" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll Up" })

vim.keymap.set("n", "d", '"_d', { desc = "Delete without replacing clipboad" })
vim.keymap.set("n", "x", '"_x', { desc = "Cut without replacing clipboad" })
vim.keymap.set("n", "c", '"_c', { desc = "Change without replacing clipboad" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without replacing clipboard" })
vim.keymap.set("v", "<C-y>", '"*y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<C-y>", cmd('%y*'), { desc = "Copy buffer to system clipboard" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<C-r>", "<Nop>")

vim.keymap.set("n", "<C-s>", "<CMD>up<CR>", { desc = "Save File" })
vim.keymap.set("n", "<C-S-s>", "<CMD>wa<CR>", { desc = "Save All Files" })

vim.keymap.set("n", "<leader><TAB>", cmd("tabnew"), { desc = "New Tab" })
vim.keymap.set("n", "<S-TAB>", cmd("tabclose"), { desc = "Close Tab" })
vim.keymap.set("n", "[<TAB>", cmd("tabprev"), { desc = "Previous Tab" })
vim.keymap.set("n", "]<TAB>", cmd("tabnext"), { desc = "Next Tab" })

vim.keymap.set("n", "g.", cmd("cd %:p:h"), { desc = "Move to this directory" })

vim.keymap.set("n", "<F3>", function()
  local clients = vim.lsp.buf_get_clients()

  for _, client in pairs(clients) do
    if client.name == "eslint" or client.name == "volar" then
      vim.cmd("EslintFixAll")
      return
    else
      vim.lsp.buf.format({ async = false })
    end
  end

  vim.api.nvim_command("update")
end, { desc = "Format & Save Buffer" })

vim.keymap.set("n", "<leader>,q", function()
  local buffers = vim.api.nvim_list_bufs()
  local windows = vim.api.nvim_list_wins()

  local displayed_buffers = {}
  for _, win in ipairs(windows) do
    local buf = vim.api.nvim_win_get_buf(win)
    displayed_buffers[buf] = true
  end

  for _, buf in ipairs(buffers) do
    if not displayed_buffers[buf] and vim.api.nvim_buf_is_loaded(buf) then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end

  vim.cmd("xa")
end, { desc = "Save All and Quit" })
vim.keymap.set("n", "<leader>,p", cmd("Lazy"), { desc = "Plugins" })

vim.keymap.set("n", "<F2>", cmd('lua require("spectre").open_file_search({select_word=true})'), { desc = "Rename" })
vim.keymap.set("n", "<F14>", cmd("Spectre"), { desc = "Rename" })
vim.keymap.set("n", "<F26>", cmd('lua require("spectre").open_visual({select_word=true})'), { desc = "Rename" })
vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go To Declaration" })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
vim.keymap.set("n", "<leader>li", cmd("LspInfo"), { desc = "LSP Info" })
vim.keymap.set("n", "<leader>lm", cmd("Mason"), { desc = "Mason" })
vim.keymap.set("n", "<leader>lr", cmd("LspRestart"), { desc = "LSP Restart" })
vim.keymap.set("n", "<leader>ls", cmd("LspStart"), { desc = "LSP Start" })
vim.keymap.set("n", "<leader>lq", cmd("LspStop"), { desc = "LSP Stop" })
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
