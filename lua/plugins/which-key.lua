local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = true,
  config = function()
    local wk = require("which-key")

    local normal_mappings = {
      ["a"] = {
        name = "Actions",
        ["c"] = { vim.lsp.buf.code_action, "Code Action" },
        ["d"] = { vim.diagnostic.open_float, "Show Line Diagnostics" },
        ["f"] = { function()
          vim.lsp.buf.format({ async = true })
          vim.api.nvim_command("update")
        end, "Format" },
        ["h"] = { "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Harpoon"},
        ["j"] = { "<CMD>lua MiniSplitjoin.join()<CR>_", "Join"},
        ["k"] = { vim.lsp.buf.hover, "Hover Doc" },
        ["K"] = { vim.lsp.buf.signature_help, "Hover Signature" },
        ["l"] = {
          name = "LSP",
          ["d"] = { "<CMD>Telescope lsp_definitions<CR>" , "Go to Definition" },
          ["D"] = { vim.lsp.buf.declaration , "Go to Declaration" },
          ["i"] = { "<CMD>Telescope lsp_implementations<CR>", "View Implementations" },
          ["o"] = { "<CMD>SymbolsOutline<CR>", "Outline" },
          ["r"] = { "<CMD>Telescope lsp_references<CR>", "View References" },
        },
        ["r"] = { vim.lsp.buf.rename, "Rename" },
        ["s"] = { "<CMD>lua MiniSplitjoin.split()<CR>_", "Split"},
        ["t"] = { "<CMD>TroubleToggle<CR>", "Trouble" },
        ["w"] = { "<CMD>up<CR>", "Save File" },
        ["W"] = { "<CMD>wa<CR>", "Save All Files" },
      },
      ["f"] = {
        name = "File",
        ["e"] = { "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", "File Browser (Current File)" },
        ["f"] = { "<CMD>Telescope find_files<CR>", "Find File" },
        ["s"] = { "<CMD>Telescope current_buffer_fuzzy_find<CR>", "Find Recent File" },
        ["r"] = { "<CMD>Telescope oldfiles<CR>", "Find Recent File" },
      },
      ["p"] = {
        name = "Project",
        -- TODO: Add replace functionality
        -- ["R"] = { "", "Replace in Files" },
        ["v"] = { "<CMD>Telescope file_browser<CR>", "File Browser" },
      },
      ["t"] = {
        name = "Telescope",
        ["n"] = { "<CMD>Telescope notify layout_strategy=vertical initial_mode=normal<CR>", "Notify" },
        ["m"] = { "<CMD>Telescope<CR>", "Menu" },
        ["h"] = { "<CMD>Telescope harpoon marks<CR>", "Harpoon" },
      },
      ["w"] = {
        name = "Window",
        ["c"] = { "<CMD>close<CR>", "Close" },
        ["n"] = { "<CMD>NoNeckPainScratchPad<CR>", "ScratchPad" },
        ["s"] = { "<CMD>split<CR>", "Horizontal Split" },
        ["t"] = { "<CMD>NoNeckPain<CR>", "Toggle" },
        ["v"] = { "<CMD>vsplit<CR>", "Vertical Split" },
        ["+"] = { "<CMD>NoNeckPainWidthUp<CR>", "Widen" },
        ["-"] = { "<CMD>NoNeckPainWidthDown<CR>", "Narrow" },
      },
      [","] = {
        name = "Editor Settings",
        ["c"] = { "<CMD>Telescope colorscheme<CR>", "Colorscheme" },
        ["o"] = { "<CMD>Telescope vim_options<CR>", "Options" },
        ["p"] = { "<CMD>Lazy<CR>", "Plugins" },
        ["q"] = { "<CMD>qa<CR>", "Quit" },
        ["l"] = {
          name = "LSP",
          ["i"] = { "<CMD>LspInfo<CR>", "Info" },
          ["m"] = { "<CMD>Mason<CR>", "Mason" },
          ["r"] = { "<CMD>LspRestart<CR>", "Restart" },
          ["s"] = { "<CMD>LspStart<CR>", "Start" },
          ["S"] = { "<CMD>LspStop<CR>", "Stop" },
        },
      },
      [">"] = { "<CMD>lua require('harpoon.mark').add_file()<CR>", "Harpoon - Add File" },
      ["<TAB>"] = { "<CMD>lua require('harpoon.marks').nav_next()<CR>", "Harpoon - Next File" },
      ["<S-TAB>"] = { "<CMD>lua require('harpoon.marks').nav_prev()<CR>", "Harpoon - Previous File" },
      ["/"] = { "<CMD>Telescope live_grep<CR>", "Live Grep" },
    }

    local normal_opts = {
      mode = "n", -- NORMAL mode
      prefix = "<leader>",
      buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    }

    wk.setup({
      ignore_missing = false,
    })
    wk.register(normal_mappings, normal_opts)
  end,
}

return M
