local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = true,
  config = function()
    local wk = require("which-key")

    local normal_mappings = {
      ["f"] = {
        name = "File",
        ["f"] = { "<CMD>Telescope find_files<CR>", "Find File" },
        ["s"] = { "<CMD>up<CR>", "Save File" },
        ["S"] = { "<CMD>wa<CR>", "Save All Files" },
        ["e"] = { "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", "File Browser (Current File)" },
        ["r"] = { "<CMD>Telescope oldfiles<CR>", "Find Recent File" },
        ["t"] = { "<CMD>Telescope grep_string<CR>", "Find Text" },
      },
      ["L"] = {
        name = "LSP",
        ["i"] = { "<CMD>LspInfo<CR>", "Info" },
        ["m"] = { "<CMD>Mason<CR>", "Mason" },
        ["r"] = { "<CMD>LspRestart<CR>", "Restart" },
        ["s"] = { "<CMD>LspStart<CR>", "Start" },
        ["S"] = { "<CMD>LspStop<CR>", "Stop" },
      },
      ["p"] = {
        name = "Project",
        -- TODO: Add replace functionality
        -- ["R"] = { "", "Replace in Files" },
        ["v"] = { "<CMD>Telescope file_browser<CR>", "File Browser" },
      },
      ["t"] = {
        name = "Telescope",
        ["g"] = { "<CMD>GrapplePopup tags<CR>", "Grapple" },
        ["n"] = { "<CMD>Telescope notify layout_strategy=vertical initial_mode=normal<CR>", "Notify" },
        ["T"] = { "<CMD>Telescope<CR>", "Telescope" },
      },
      ["T"] = { "<CMD>TroubleToggle<CR>", "Trouble" },
      ["w"] = {
        name = "Window",
        ["c"] = { "<CMD>NoNeckPain<CR>", "Center" },
        ["n"] = { "<CMD>NoNeckPainWidthDown<CR>", "Narrow" },
        ["w"] = { "<CMD>NoNeckPainWidthUp<CR>", "Widen" },
        ["q"] = { "<CMD>close<CR>", "Close" },
      },
      [","] = {
        name = "Editor Settings",
        ["c"] = { "<CMD>Telescope colorscheme<CR>", "Colorscheme" },
        ["o"] = { "<CMD>Telescope vim_options<CR>", "Options" },
        ["p"] = { "<CMD>Lazy<CR>", "Plugins" },
        ["q"] = { "<CMD>qa<CR>", "Quit" },
      },
      ["/"] = { "<CMD>Telescope live_grep<CR>", "Live Grep" },
      [">"] = { "<CMD>GrappleTag<CR>", "GrappleTag" },
      ["<TAB>"] = {
        ["n"] = { "<CMD>GrappleCycle forward<CR>", "Grapple Forward" },
        ["p"] = { "<CMD>GrappleCycle backward<CR>", "Grapple Backward" },
      },
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
