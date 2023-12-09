local M = {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "op read op://Personal/OpenAI/credential --no-newline",
    })
  end,
}

return M
