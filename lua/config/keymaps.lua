local cmd = require("utils").cmd

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" });

vim.keymap.set("n", "<leader><leader>", ":", { desc = "Command" })

vim.keymap.set("n", "<esc>", "<CMD>noh<CR>", { desc = "Clear search results" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll Down" })
vim.keymap.set("n", "<C-b>", "<C-b>zz", { desc = "Scroll Up" })

vim.keymap.set("v", "<", "<gv", { desc = "Persist while indenting" })
vim.keymap.set("v", ">", ">gv", { desc = "Persist while indenting" })

vim.keymap.set("n", "d", '"_d', { desc = "Delete without replacing clipboad" })
vim.keymap.set("n", "x", '"_x', { desc = "Cut without replacing clipboad" })
vim.keymap.set("n", "c", '"_c', { desc = "Change without replacing clipboad" })
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without replacing clipboard" })

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
vim.keymap.set("n", "<C-r>", "<Nop>")

vim.keymap.set("n", "<C-s>", "<CMD>up<CR>", { desc = "Save File" })
vim.keymap.set("n", "<C-S-s>", "<CMD>wa<CR>", { desc = "Save File" })

vim.keymap.set("n", "<A-t>", "<CMD>tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<A-S-t>", "<CMD>tabclose<CR>", { desc = "Close Tab" })
vim.keymap.set("n", "[<TAB>", "<CMD>tabnext<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "]<TAB>", "<CMD>tabprevious<CR>", { desc = "Previous Tab" })

vim.keymap.set("n", "<F1>", "<CMD>Telescope help_tags<CR>", { desc = "Find Help" })

-- Leader Mappings
vim.keymap.set('n', '<leader>e', cmd('lua MiniFiles.open(vim.api.nvim_buf_get_name(0))'), { desc = 'File Manager' })
vim.keymap.set('n', '<leader>E', require('mini.files').open, { desc = 'File Manager' })

vim.keymap.set("n", "<leader>ff", cmd('Telescope find_files'), { desc = "Find Files" })
vim.keymap.set("n", "<leader>fl", cmd('lua MiniVisits.select_label()'), { desc = "Labeled Files" })
vim.keymap.set("n", "<leader>fp", cmd('lua MiniVisits.select_path()'), { desc = "Frecent Files" })
vim.keymap.set(
  "n",
  "<leader>fF",
  function()
    vim.lsp.buf.format({ async = true })
    vim.api.nvim_command("update")
  end,
  { desc = "Format Buffer" }
)
vim.keymap.set("n", '<leader>fo', cmd('Telescope oldfiles'), { desc = 'Telescope Recent Files'})
vim.keymap.set("n", '<leader>fs', cmd('Telescope current_buffer_fuzzy_find'), { desc = 'Find in Buffer'})
vim.keymap.set("n", '<leader>ft', cmd('TrailBlazerToggleTrailMarkList'), { desc = 'TrailBlazer Marks List'})
vim.keymap.set("n", '<leader>f/', cmd('Telescope live_grep'), { desc = 'Telescope Live Grep'})

vim.keymap.set("n", '<leader>wt', cmd('NoNeckPain'), { desc = 'Center Buffer'})
vim.keymap.set("n", '<leader>w-', cmd('NoNeckPainWidthDown'), { desc = 'Narrow'})
vim.keymap.set("n", '<leader>w+', cmd('NoNeckPainWidthUp'), { desc = 'Widen'})

vim.keymap.set("n", '<leader>vl', cmd('lua MiniVisits.add_label()'), { desc = "Add Label"})
vim.keymap.set("n", '<leader>vL', cmd('lua MiniVisits.remove_label()'), { desc = "Remove Label"})
vim.keymap.set("n", '<leader>vp', cmd('lua MiniVisits.add_path()'), { desc = "Add Path"})
vim.keymap.set("n", '<leader>vP', cmd('lua MiniVisits.remove_path()'), { desc = "Remove Path"})

vim.keymap.set('n', '<leader>,x', cmd('xa'), { desc = 'Save All and Quit' })
vim.keymap.set('n', '<leader>,c', cmd('Telescope colorschemes'), { desc = 'Colorschemes' })
vim.keymap.set('n', '<leader>,o', cmd('Telescope vim_options'), { desc = 'Options' })
vim.keymap.set('n', '<leader>,p', cmd('Lazy'), { desc = 'Plugins' })

-- LSP Mappings
vim.keymap.set('n', '<F2>', cmd('lua require("spectre").open_file_search({select_word=true})'), { desc = 'Rename'})
vim.keymap.set('n', '<F26>', cmd('lua require("spectre").open_visual({select_word=true})'), { desc = 'Rename'})
vim.keymap.set('n', '<F14>', cmd('Spectre'), { desc = 'Rename'})
vim.keymap.set('n', '<F12>', cmd('Lspsaga goto_definition'), { desc = 'Go To Definitions'})
vim.keymap.set('n', '<F24>', cmd('Lspsaga finder'), { desc = 'Finder'})
vim.keymap.set('i', '<F60>', vim.lsp.buf.signature_help, { desc = 'Signature Help'})
vim.keymap.set('n', '<leader>lc', cmd('Lspsaga code_action'), { desc = 'Code Action'})
vim.keymap.set('n', '<leader>ll', cmd('Lspsaga show_line_diagnostics'), { desc = 'Show Line Diagnostics'})
vim.keymap.set("n", '<leader>lo', cmd('Lspsaga outline'), { desc = 'Document Symbols'})
vim.keymap.set("n", '<leader>ld', cmd('TroubleToggle document_diagnostics'), { desc = 'Diagnostics'})
vim.keymap.set("n", '<leader>lD', cmd('TroubleToggle workspace_diagnostics'), { desc = 'Diagnostics'})
vim.keymap.set("n", '<leader>li', cmd('LspInfo'), { desc = 'LSP Info'})
vim.keymap.set("n", '<leader>lm', cmd('Mason'), { desc = 'Mason'})
vim.keymap.set("n", '<leader>lr', cmd('LspRestart'), { desc = 'LSP Restart'})
vim.keymap.set("n", '<leader>ls', cmd('LspStart'), { desc = 'LSP Start'})
vim.keymap.set("n", '<leader>lS', cmd('LspStop'), { desc = 'LSP Stop'})
