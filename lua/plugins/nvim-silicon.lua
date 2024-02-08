local cmd = require('utils').cmd

local M = {
  "michaelrommel/nvim-silicon",
  event = "VeryLazy",
  cmd = "Silicon",
  config = function ()
    require('silicon').setup({
      font = "Geist Mono",
      theme = "monokai",
      background = "#076678",
      background_image = nil,
      pad_horiz = 100,
      pad_vert = 80,
      no_round_corner = false,
      no_window_controls = false,
      no_line_number = false,
      line_offset = function(args)
        return args.line1
      end,
      line_pad = 0,
      tab_width = 4,
      language = function()
        return vim.bo.filetype
      end,
      shadow_blur_radius = 16,
      shadow_offset_x = 8,
      shadow_offset_y = 8,
      shadow_color = "#100808",
      gobble = false,
      output = function()
        return "/Users/jobanmendpara/Downloads/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
      end,
      to_clipboard = true,
      command = "silicon",
      window_title = function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
      end,
    })
  end,
}

return M
