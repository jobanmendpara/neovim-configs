-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

local M  = {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufReadPre",
	opts = {
    show_end_of_line = false,
    space_char_blankline = " ",
    show_current_context = false,
    show_current_context_start = true,
    filetype_exclude = {
    "help",
    },
  },
}

return M
