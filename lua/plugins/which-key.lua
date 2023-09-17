local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = true,
  config = function()
    local wk = require("which-key")

    local normal_mappings = {
      ["c"] = { "<CMD>close<CR>", "Close" },
      ["e"] = { "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", "File Browser - CWD" },
      ["E"] = { "<CMD>Telescope file_browser<CR>", "File Browser - Root" },
      ["f"] = {
        name = "File",
        ["f"] = { "<CMD>Telescope find_files<CR>", "Find File" },
        ["F"] = { function()
          vim.lsp.buf.format({ async = true })
          vim.api.nvim_command("update")
        end, "Format" },
        ["o"] = { "<CMD>Telescope oldfiles<CR>", "Find Recent File" },
        ["r"] = { vim.lsp.buf.rename, "Rename" },
        ["s"] = { "<CMD>Telescope current_buffer_fuzzy_find<CR>", "Find Recent File" },
      },
      ["g"] = {
        name = "Go",
        ["g"] = { "<CMD>GrapplePopup tags<CR>" , "Grapple Popup"},
        ["t"] = { "<CMD>TrailBlazerToggleTrailMarkList<CR>" , "TrailBlazer Marks List"},
      },
      ["o"] = { "<CMD>SymbolsOutline<CR>", "Outline" },
      ["d"] = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Trouble" },
      ["t"] = { "<CMD>Telescope<CR>", "Telescope" },
      ["w"] = {
        name = "Window",
        ["t"] = { "<CMD>NoNeckPain<CR>", "Toggle" },
        ["+"] = { "<CMD>NoNeckPainWidthUp<CR>", "Widen" },
        ["-"] = { "<CMD>NoNeckPainWidthDown<CR>", "Narrow" },
      },
      [","] = {
        name = "Editor Settings",
        ["c"] = { "<CMD>Telescope colorscheme<CR>", "Colorscheme" },
        ["o"] = { "<CMD>Telescope vim_options<CR>", "Options" },
        ["p"] = { "<CMD>Lazy<CR>", "Plugins" },
        ["x"] = { "<CMD>xa<CR>", "Quit" },
        ["i"] = { "<CMD>LspInfo<CR>", "LSP Info" },
        ["m"] = { "<CMD>Mason<CR>", "Mason" },
        ["r"] = { "<CMD>LspRestart<CR>", "LSP Restart" },
        ["s"] = { "<CMD>LspStart<CR>", "LSP Start" },
        ["S"] = { "<CMD>LspStop<CR>", "Stop" },
      },
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
