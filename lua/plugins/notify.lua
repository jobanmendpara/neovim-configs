local M = {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	opts = {
    stages = "static",
		timeout = 1250,
    render = "compact",
		fps = 60,

		max_height = function()
			return math.floor(vim.o.lines * 0.50)
		end,
		max_width = function()
			return math.floor(vim.o.columns * 0.50)
		end,
	},
}

return M
