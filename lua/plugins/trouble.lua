local M = {
  "folke/trouble.nvim",
  branch = "dev", -- IMPORTANT!
  enabled = true,
  keys = {
    {
      "<leader><F8>",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader><F20>",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader><F32>",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader><F56>",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
  },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
}

return M
