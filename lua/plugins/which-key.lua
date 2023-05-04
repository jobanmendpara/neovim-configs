return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  lazy = false,
  config = function()
    local wk = require("which-key")

    local normal_mappings = {
      ["e"] = { "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", "File Browser (Current File)" },
      ["E"] = { "<CMD>Telescope file_browser<CR>", "File Browser" },
      ["f"] = {
        ["f"] = { "<CMD>Telescope find_files<CR>", "Find File" },
        ["l"] = { "<CMD>Telescope live_grep<CR>", "Live Grep" },
      },
      ["g"] = {
        -- ["m"] = { "<CMD>Telescope harpoon marks<CR>", "Harpoon" },
      },
      ["w"] = {
        ["h"] = { "<CMD>split<CR>", "Horizontal Split" },
        ["v"] = { "<CMD>vsplit<CR>", "Vertical Split" },
      },
      [">"] = { "<CMD>lua require('harpoon.mark').add_file()<CR>", "Throw Harpoon" },
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
