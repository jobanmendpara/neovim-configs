local cmd = require("utils").cmd
local M = {
  "folke/trouble.nvim",
  event = "BufEnter",
  config = function ()
    require("trouble").setup({
      mode = "workspace_diagnostics"
    })
  end,
  keys = {
    {
      "<leader>td",
      cmd("TroubleToggle document_diagnostics"),
      desc = "View Document Diagnostics",
    },
    {
      "<leader>tw",
      cmd("TroubleToggle workspace_diagnostics"),
      desc = "View Workspace Diagnostics",
    },
    {
      "gd",
      function ()
        require("trouble").toggle("lsp_definitions")
      end,
      desc = "View Definitions"
    },
    {
      "gi",
      function ()
        require("trouble").toggle("lsp_implementations")
      end,
      desc = "View Implementations",
    },
    {
      "gR",
      function ()
        require("trouble").toggle("lsp_references")
      end,
      desc = "View References"
    },
    {
      "gT",
      function ()
        require("trouble").toggle("lsp_type_definitions")
      end,
      desc = "View References"
    },
  }
}

return M

