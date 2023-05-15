return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = true,
  config = function()
    local wk = require("which-key")

    local normal_mappings = {
      [","] = {
        name = "Settings",
        ["c"] = { "<CMD>Telescope colorscheme<CR>", "Colorscheme"},
        ["o"] = { "<CMD>Telescope vim_options<CR>", "Options"},
        ["l"] = { "<CMD>Lazy<CR>", "Lazy" },
      },
      ["/"] = { "<CMD>Telescope live_grep<CR>", "Live Grep" },
      [">"] = { "<CMD>lua require('harpoon.mark').add_file()<CR>", "Throw Harpoon" },
      ["f"] = {
        name = "File",
        ["f"] = { "<CMD>Telescope find_files<CR>", "Find File" },
        ["s"] = { "<CMD>w<CR>", "Save File"},
        ["S"] = { "<CMD>wa<CR>", "Save All Files"},
        ["e"] = { "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", "File Browser (Current File)" },
        ["r"] = { "<CMD>Telescope oldfiles<CR>", "Find Recent File" },
        ["t"] = { "<CMD>Telescope current_buffer_fuzzy_find<CR>", "Find Text" },
      },
      ["p"] = {
        name = "Project",
        ["e"] = { "<CMD>Telescope file_browser<CR>", "File Browser" },
        ["h"] = { "<CMD>Telescope harpoon marks<CR>", "Harpoon" },
       -- TODO: Add replace functionality 
        ["R"] = { "<CMD>Lspsaga rename ++project<CR>", "Replace in Files"},
      },
      ["t"] = { "<CMD>Telescope<CR>", "Telescope" },
      ["]"] = {
        name = "LSP",
        ["i"] = { "<CMD>LspInfo<CR>", "Info" },
        ["m"] = { "<CMD>Mason<CR>", "Mason" },
        ["r"] = { "<CMD>LspRestart<CR>", "Restart" },
        ["s"] = { "<CMD>LspStart<CR>", "Start" },
        ["t"] = { "<CMD>TroubleToggle<CR>", "Trouble"},
        ["x"] = { "<CMD>LspStop<CR>", "Stop" },
      },
      ["w"] = {
        name = "Window",
        ["-"] = { "<CMD>split<CR>", "Split Window Below" },
        ["/"] = { "<CMD>vsplit<CR>", "Split Window Right" },
        ["d"] = { "<CMD>q<CR>", "Close Window" },
        ["D"] = { "<CMD>only<CR>", "Close All Other Windows" },
        ["c"] = { "<CMD>NoNeckPain<CR>", "No Neck Pain"},
        ["x"] = { "<CMD>qa<CR>", "Close All Windows" },
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
